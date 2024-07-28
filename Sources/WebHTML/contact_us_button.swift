//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 28-12-2023.
//

import Foundation
import HTML

public extension Node where Context == HTML.BodyContext {
    static let contact_us_button: Self = .a(
        .class("btn btn-link p-3 rounded-3"),
        .style("background-color: rgb(244, 244, 249);"),
        .attribute(named: "role", value: "button"),
        .href("mailto: info@TenThijeBoonkkamp.legal?subject=I'm interested in your work&body=Dear TenThijeBoonkkamp, I'm interested in TenThijeBoonkkamp because... "),
        .text("Contact us")
    )

    static func in_development() -> Self {
        .button(
            .class("btn btn btn-warning p-3 rounded-3"),
            .text("Coming soon")
        )
    }
}
