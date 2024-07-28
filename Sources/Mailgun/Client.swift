//  MIT License
//  
//  Copyright (c) 2018 Point-Free, Inc.
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import DecodableRequest
import Dependencies
import DependenciesMacros
import Either
import EmailAddress
import Foundation
import FoundationPrelude
import HttpPipeline
import Logging
import LoggingDependencies
import MemberwiseInit
import Tagged
import UrlFormEncoding

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

@DependencyClient
public struct Client {
    public typealias ApiKey = Tagged<(Self, apiKey: ()), String>
    public typealias Domain = Tagged<(Self, domain: ()), String>

    public let appSecret: AppSecret

    public var sendEmail: (Email) async throws -> SendEmailResponse
    public var validate: (_ emailAddress: EmailAddress) async throws -> Validation

    @MemberwiseInit(.public)
    public struct Validation: Codable {
        public var mailboxVerification: Bool

        public enum CodingKeys: String, CodingKey {
            case mailboxVerification = "mailbox_verification"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.mailboxVerification =
            Bool(try container.decode(String.self, forKey: .mailboxVerification)) ?? false
        }
    }

    public init(
        baseUrl: URL,
        apiKey: ApiKey,
        appSecret: AppSecret,
        domain: Client.Domain
    ) {
        self.appSecret = appSecret

        self.sendEmail = { email in
            try await runMailgun(baseUrl: baseUrl, apiKey: apiKey)(
                mailgunSend(email: email, domain: domain))
        }
        self.validate = { emailAddress in
            try await runMailgun(baseUrl: baseUrl, apiKey: apiKey)(mailgunValidate(email: emailAddress))
        }
    }

    /// Constructs the email address that users can email in order to unsubscribe from a particular newsletter.
    public func unsubscribeEmail(
        fromUserId userId: UUID,
        andNewsletter newsletter: EmailSetting.Newsletter,
        boundary: String = "--"
    ) -> EmailAddress? {

        guard
            let payload = encrypted(
                text: "\(userId.uuidString)\(boundary)\(newsletter.rawValue)",
                secret: self.appSecret.rawValue,
                nonce: [0x30, 0x9D, 0xF8, 0xA2, 0x72, 0xA7, 0x4D, 0x37, 0xB9, 0x02, 0xDF, 0x4F]
            )
        else { return nil }

        return .init(rawValue: "unsub-\(payload)@pointfree.co")
    }

    // Decodes an unsubscribe email address into the user and newsletter that is represented by the address.
    public func userIdAndNewsletter(
        fromUnsubscribeEmail email: EmailAddress,
        boundary: String = "--"
    ) -> (User.IDValue, EmailSetting.Newsletter)? {

        let payload = email.rawValue
            .components(separatedBy: "unsub-")
            .last
            .flatMap { $0.split(separator: "@").first }
            .map(String.init)

        return payload
            .flatMap { decrypted(text: $0, secret: self.appSecret.rawValue) }
            .map { $0.components(separatedBy: boundary) }
            .flatMap { components in
                guard
                    let userId = components.first.flatMap(User.IDValue.init(uuidString:)),
                    let newsletter = components.last.flatMap(EmailSetting.Newsletter.init(rawValue:))
                else { return nil }

                return (userId, newsletter)
            }
    }

    public func verify(payload: MailgunForwardPayload, with apiKey: ApiKey) -> Bool {
        let digest = hexDigest(
            value: "\(payload.timestamp)\(payload.token)",
            asciiSecret: apiKey.rawValue
        )
        return payload.signature == digest
    }
}

public extension URL {
    static let mailgun_eu_baseUrl: Self = URL(string: "https://api.mailgun.net")!
    static let mailgun_usa_baseUrl: Self = URL(string: "https://api.eu.mailgun.net")!
}

extension URLRequest {
    fileprivate mutating func set(baseUrl: URL) {
        self.url = URLComponents(url: self.url!, resolvingAgainstBaseURL: false)?.url(
            relativeTo: baseUrl)
    }
}

private func runMailgun<A>(
//    baseUrl:URL = URL(string: "https://api.eu.mailgun.net")!,
    baseUrl: URL,
    apiKey: Client.ApiKey
) async throws -> (DecodableRequest<A>?) async throws -> A {

    return { mailgunRequest in
//        guard let baseUrl = URL(string: "https://api.mailgun.net")
//        else { throw MailgunError("wrong baseurl") }
        guard var mailgunRequest = mailgunRequest
        else { throw MailgunError("mailgunRequest is nil") }

        mailgunRequest.rawValue.set(baseUrl: baseUrl)
        mailgunRequest.rawValue.attachBasicAuth(username: "api", password: apiKey.rawValue)

        return try await dataTask(with: mailgunRequest.rawValue)
            .map { data, _ in data }
            .flatMap { data in
                    .wrap {
                        do {
                            return try jsonDecoder.decode(A.self, from: data)
                        } catch {
                            throw (try? jsonDecoder.decode(MailgunError.self, from: data))
                            ?? JSONError.error(String(decoding: data, as: UTF8.self), error) as Error
                        }
                    }
            }
            .performAsync()
    }
}

private func mailgunRequest<A>(_ path: String, _ method: FoundationPrelude.Method = .get([:]))
-> DecodableRequest<A> {

    var components = URLComponents(url: URL(string: path)!, resolvingAgainstBaseURL: false)!
    if case let .get(params) = method {
        components.queryItems = params.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }
    }

    var request = URLRequest(url: components.url!)
    request.attach(method: method)
    return DecodableRequest(rawValue: request)
}

private func mailgunSend(email: Email, domain: Client.Domain) -> DecodableRequest<SendEmailResponse> {
    var params: [String: String] = [:]
    params["from"] = email.from.rawValue
    params["to"] = email.to.map(\.rawValue).joined(separator: ",")
    params["cc"] = email.cc?.map(\.rawValue).joined(separator: ",")
    params["bcc"] = email.bcc?.map(\.rawValue).joined(separator: ",")
    params["subject"] = email.subject
    params["text"] = email.text
    params["html"] = email.html
    params["tracking"] = email.tracking?.rawValue
    params["tracking-clicks"] = email.trackingClicks?.rawValue
    params["tracking-opens"] = email.trackingOpens?.rawValue
    email.headers.forEach { key, value in
        params["h:\(key)"] = value
    }

    return mailgunRequest("v3/\(domain.rawValue)/messages", Method.post(params))
}

private func mailgunValidate(email: EmailAddress) -> DecodableRequest<Client.Validation> {
    return mailgunRequest(
        "v3/address/private/validate",
        .get([
            "address": email.rawValue,
            "mailbox_verification": true
        ])
    )
}

public struct MailgunError: Codable, Swift.Error {
    let description: String
    public init(_ description: String = "") {
        self.description = description
    }
}

private let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return decoder
}()

extension Client: TestDependencyKey {
    public static let testValue = Client(appSecret: "deadbeefdeadbeefdeadbeefdeadbeef")
}

extension DependencyValues {
    public var mailgun: Client {
        get { self[Client.self] }
        set { self[Client.self] = newValue }
    }
}
