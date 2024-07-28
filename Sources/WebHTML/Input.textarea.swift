//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 30/05/2022.
//

import Foundation
import HTML

public extension Node where Context == HTML.BodyContext {
    static func textarea(
        id: String,
        label: String,
        placeholder: String = " ",
        height: String? = nil
    ) -> Self {
        .div(
            .class("form-floating"),
            .textarea(
                .class("form-control"),
                .id(id),
                .name(id),
                .placeholder(placeholder),
                .unwrap(height) { height in .attribute(named: "style", value: "height:\(height);") }
            ),
            .label(
                .for(id),
                .text(label)
            )
        )
    }
}
