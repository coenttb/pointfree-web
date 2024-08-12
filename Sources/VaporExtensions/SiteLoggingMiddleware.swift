//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 18-12-2023.
//

import Dependencies
import LoggingDependencies
import MemberwiseInit
import Vapor
import VaporRouting

public struct SiteLoggingMiddleware: AsyncMiddleware {

  public init(){}
  
    public func respond(to request: Vapor.Request, chainingTo next: Vapor.AsyncResponder) async throws -> Vapor.Response {
//        @Dependency(\.server_request) var server_request
        @Dependency(\.logger) var logger

//        print("server_request", server_request)
//        logger.log(
//            .info,
//        """
//        \(server_request.id) [Request] \(request.method) \
//        \(request.url.path)
//        """
//        )
//
//        defer {
//            let endTime = Date().timeIntervalSince1970
//            logger.log(.info, "\(server_request.id) [Time] \(Int((endTime - server_request.startTime.timeIntervalSince1970)))ms")
//        }

        return try await next.respond(to: request)
    }
}
