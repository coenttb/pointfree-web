//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 06-01-2024.
//

import Foundation
import HTML

extension Node<HTML.BodyContext> {
    public static func simpleHeader(
        logo: Node<HTML.BodyContext>,
        title: String = "",
        subtitle: String = ""
    ) -> Self {
        return .div(
            .class("container mb-1"),
            .div(
                .class("row"),
                .div(
                    .class("col-12 text-center"),
                    .div(
                        .class("mb-4"),
                        logo
                    ),
                    .if(!title.isEmpty) {
                        .h1(
                            .class("h3 mb-2 fw-bold"),
                            .text(title)
                        )
                    },
                    .if(!subtitle.isEmpty) {
                        .small(
                            .class("text-muted text-center"),
                            .p(subtitle)
                        )
                    }
                )
            )
        )
    }
}
