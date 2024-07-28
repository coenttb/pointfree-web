//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 10/08/2022.
//
//
import Foundation
import HTML

public extension Node where Context == HTML.BodyContext {
    static let jqueryJS: Self = .script(
        .src(URL.jqueryJS.absoluteString)
    )
}

public extension URL {
    static let jqueryJS: Self = .init(string: "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js")!
}
