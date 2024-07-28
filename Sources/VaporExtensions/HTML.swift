//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 27/05/2022.
//

import HTML_Web
import Vapor
import VaporRouting

extension HTMLDocument {
  public func encodeResponse(for request: Request) async throws -> Response {
    var headers = HTTPHeaders()
    headers.add(name: .contentType, value: "text/html")
    
    let string = String(decoding: self.render(), as: UTF8.self)
    return .init(status: .ok, headers: headers, body: .init(string: string))
  }
}

//extension HTMLDocument: AsyncResponseEncodable {}
