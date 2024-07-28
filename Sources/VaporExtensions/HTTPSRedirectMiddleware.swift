//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 17/07/2023.
//

import MemberwiseInit
import ToolKit
import Vapor
import VaporRouting

@MemberwiseInit(.public)
public struct HTTPSRedirectMiddleware: AsyncMiddleware {

    public let on: Bool

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {

        guard on else { return try await next.respond(to: request) }

        let xForwardedProto = request.headers.first(name: HTTPHeaders.Name.xForwardedProto)
        ?? request.url.scheme
        ?? "http"

        guard xForwardedProto == "https" else {
            guard let _ = request.headers.first(name: .host) else {
                throw Abort(.badRequest)
            }

            var httpsURL = request.url
            httpsURL.scheme = "https"

            return request.redirect(to: httpsURL.string, redirectType: .permanent)
        }

        let response = try await next.respond(to: request)
        response.headers.add(
            name: "Strict-Transport-Security",
            value: "max-age=31536000; includeSubDomains; preload"
        )
        return response
    }
}
