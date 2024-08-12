//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 05-01-2024.
//

import Dependencies
import Foundation
import LoggingDependencies
import Vapor
import VaporRouting

public struct RequestLoggerMiddleware: AsyncMiddleware {

    @Dependency(\.logger) var logger

    let startMessage: (_ request: Vapor.Request) -> String

    let endMessage: (_ request: Vapor.Request, _ duration: Int) -> String

    public func respond(to request: Vapor.Request, chainingTo next: Vapor.AsyncResponder) async throws -> Vapor.Response {
        let start = Date()

        logger.log(.info, .init(stringLiteral: startMessage(request)))

        let response = try await next.respond(to: request)

        let duration: Int = .init(Date().timeIntervalSince(start) * 1000)

        logger.log(.info, .init(stringLiteral: endMessage(request, duration)))

        return response
    }

    public init(
        startMessage: @escaping (_ request: Vapor.Request) -> String = { request in
            "\(request.id) [Request] \(request.method) \(request.url)"
        },
        endMessage: @escaping (_ request: Vapor.Request, _ duration: Int) -> String = { request, duration in
            "\(request.id) [Time] \(duration)ms"
        }
    ) {
        self.startMessage = startMessage
        self.endMessage = endMessage
    }
}
