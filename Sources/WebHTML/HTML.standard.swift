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

    static func standard(
        navigationbar: Node<HTML.BodyContext>,
        title: Node<HTML.HeadContext>,
        description: TranslatedString? = nil,
        languages: [Languages.Language] = Languages.Language.allCases,
        hreflang: (Languages.Language) -> URL,
        bootstrap: (css: URL, iconsCSS: URL?, js: URL),
        jquery: URL,
        canonical_href: URL?,
        favicon: [Node<HTML.HeadContext>],
        themeColor: String,
        google_analytics_id: String?,
        hotjar_analytics_id: String?,
        header_nodes: Node<HTML.HeadContext>...,
        footer: Node<HTML.BodyContext>,
        view: Node<HTML.BodyContext>,
        flash: Flash?
    ) -> Self {
        @Dependency(\.language) var language

        return HTML(
            .attribute(named: "lang", value: language.rawValue),
            .attribute(named: "data-bs-theme", value: "auto"),
            .head(
                .default(
                    title: title,
                    description: description,
                    languages: languages,
                    hreflang: hreflang,
                    bootstrap: bootstrap.css,
                    canonical_href: canonical_href,
                    favicon: favicon,
                    themeColor: themeColor
                )
                + header_nodes
                + [bootstrap.iconsCSS.map { Node.stylesheet($0.relativePath) }].compactMap { $0 }
                + .analytics(
                    google_analytics_id: google_analytics_id,
                    hotjar_analytics_id: hotjar_analytics_id
                )
            ),
            .legalkitBody(
                navigationbar,
                .main(
                    .class("flex-grow-1"),
                    view
                ),
                flash.map(Node<HTML.BodyContext>.flash) ?? .empty,
                footer,
                .script(.raw("""
                ;(function () {
                    const htmlElement = document.querySelector("html")
                    if(htmlElement.getAttribute("data-bs-theme") === 'auto') {
                        function updateTheme() {
                            document.querySelector("html").setAttribute("data-bs-theme",
                                window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light")
                        }

                        window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', updateTheme)
                        updateTheme()
                    }
                })()
                """)),
                .script(
                    .src(bootstrap.js.relativePath)
                ),
                .script(
                    .src(jquery.absoluteString)
                )
            )
        )
    }
}
