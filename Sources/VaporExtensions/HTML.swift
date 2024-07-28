//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 27/05/2022.
//

import HTML
import Vapor
import VaporRouting

extension HTML: AsyncResponseEncodable {
    public func encodeResponse(for request: Request) async throws -> Response {
        var headers = HTTPHeaders()
        headers.add(name: .contentType, value: "text/html")
        return .init(status: .ok, headers: headers, body: .init(string: self.render()))
    }
}
