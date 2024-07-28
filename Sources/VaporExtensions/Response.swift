//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 30-12-2023.
//

import Foundation
import Vapor

public extension Response {
    static let ok: Response = Response(status: HTTPResponseStatus.accepted)
    static let error: Response = Response(status: HTTPResponseStatus.internalServerError)
    static let notFound: Response = Response(status: .notFound)
}
