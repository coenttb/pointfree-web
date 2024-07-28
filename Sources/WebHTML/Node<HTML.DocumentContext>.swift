//
//  File 2.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 27/05/2022.
//

import Foundation
import HTML

public extension Node<HTML.DocumentContext> {

    static func legalkitBody(_ nodes: Node<HTML.BodyContext>...) -> Self {
        .body(
            .class("d-flex flex-column min-vh-100 fixed-header"),
            .group(nodes)
        )
    }

    static func emailBody(_ nodes: Node<HTML.BodyContext>...) -> Self {
        .body(
            .style("margin: 0 !important; padding: 0 !important;"),
            .group(nodes)
        )
    }
}
