//
//  File 3.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 31/05/2022.
//

import Algorithms
import Dependencies
import Foundation
import HTML
import Languages
import ToolKit
import Translations
import WebDependencies

public extension Node where Context == HTML.BodyContext {
    static func footer(
        copyright_owner: String,
        language: Languages.Language,
        choose_country_region: URL,
        items: [(href: URL, text: String)]
    ) -> Self {
        @Dependency(\.appColor.bg_light) var color_light
        @Dependency(\.appColor.bg_dark) var color_dark
        let items: [Node<HTML.BodyContext>] = items.map { tuple in
            let (href, text) = tuple
            return Node.a(
                .class("text-muted"),
                .href(href.relativePath),
                .small(.text(text))
            )
        }.interspersed(with: Node.separator).map { $0 }
        let id: String = UUID().uuidString
        return .footer(
            .class("mt-auto py-2 rounded-bottom rounded-5"),
            .section(
                .id(id),
                .class("container footer py-3"),
                .div(
                    .class("row g-3 align-items-end"),
                    .div(
                        .class("col-md-12 col-lg-6 col-xl-4 order-2 order-md-2 order-lg-1 order-xl-1 text-muted"),
                        .small("\(String.copyright.description.capitalizingFirstLetter()) © 2024 \(copyright_owner). \(String.all_rights_reserved.description.capitalizingFirstLetter()).")
                    ),
                    .div(
                        .class("col-md-12 col-lg-12 col-xl-5  order-3 order-md-3 order-lg-3 order-xl-2 text-muted"),
                        .group(items)
                    ),
                    .div(
                        .class("col-md-12 col-lg-6 col-xl-3  order-1 order-md-1 order-lg-2 order-xl-3 text-lg-end"),
                        .small(
                            .class("text-muted"),
                            .a(
                                .href(choose_country_region.relativePath),
                                .text("\(language.icon) \(language.name(language))")
                            )
                        )
                    )
                )
            )
        )
    }
}
