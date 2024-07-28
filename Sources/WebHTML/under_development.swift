//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 22-01-2024.
//

import Foundation
import HTML
import Languages

extension Node<HTML.BodyContext> {
    public static func under_development() -> Self {
        .a(
            .attribute(named: "role", value: "button"),
            .class("btn btn-secondary"),
            .attribute(named: "disabled"),
            .text("under development")
        )
    }
}
