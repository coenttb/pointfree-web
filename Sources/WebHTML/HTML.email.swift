//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 28-12-2023.
//

import Dependencies
import Foundation
import HTML
import Languages
import WebModels

public extension HTML {

    static func email(
        title: Node<HTML.HeadContext> = .empty,
        css: String,
//        header_nodes: Node<HTML.HeadContext>...,
        footer: Node<HTML.BodyContext> = .empty,
        view: Node<HTML.BodyContext>
    ) -> Self {
        @Dependency(\.language) var language

        return HTML(
            .attribute(named: "lang", value: language.rawValue),
            .attribute(named: "data-bs-theme", value: "dark"),
            .emailHead(
                title: title,
                css: css,
                nodes: .empty
            ),
            .emailBody(
                .main(
                    view
                ),
                footer
            )
        )
    }
}
