//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 17-01-2024.
//

import Foundation
import Plot

extension Node<HTML.BodyContext> {
    public static func header_section(
        title: Node<HTML.BodyContext>...,
        subtitle: Node<HTML.BodyContext>...
    ) -> Self {
        .section(
            .class("section-gradient"),
            .div(
                .class("container"),
                .div(
                    .class("section-layout-container "),
                    .div(
                        .class("gradient-area"),
                        .div(
                            .class("gradient-title-area"),
                            .h1(
                                .class("text text-above section-title-1"),
                                .group(title)
                            )
                        ),
                        .if(subtitle != .empty) {
                            .h2(
                                .group(subtitle)
                            )
                        }
                    )
                )
            )
        )
    }

    public static func section_gradient(
        title: Node<HTML.BodyContext>...,
        subtitle: Node<HTML.BodyContext>...
    ) -> Self {
        .section(
            .class("section-gradient position-relative hardware-accelerate"),
            .div(
                .class("container hardware-accelerate"),
                .div(
                    .class("section-layout-container hardware-accelerate"),
                    .div(
                        .class("gradient-padding-top hardware-accelerate"),
                        .div(
                            .class("gradient-area hardware-accelerate"),
                            .div(
                                .class("gradient-title-area hardware-accelerate"),
                                .h1(
                                    .class("position-relative text text-above section-title-1 hardware-accelerate unselectable"),
                                    .group(title)
                                ),
                                .div(
                                    .class("position-absolute section-background-wrap hardware-accelerate unselectable"),
                                        .element(
                                            named: "canvas",
                                            attributes: [
                                                .id("gradient-canvas"),
                                                .data(named: "js-darken-top", value: ""),
                                                .data(named: "data-transition-in", value: "")
                                            ]
                                        ),
                                    .script(.raw("""
                                        var gradient = new Gradient()
                                        gradient.initGradient('#gradient-canvas');
                                    """))
                                ),
                                .div(
                                    .class("position-absolute text text-under text-under-blended section-title-1 hardware-accelerate unselectable"),
                                    .group(title)
                                ),
                                .div(
                                    .class("position-absolute text text-under text-under-overlay section-title-1 hardware-accelerate"),
                                    .group(title)
                                )
                            ),
                            .if(subtitle != .empty) {
                                .h2(
                                    .group(subtitle)
                                )
                            }
                        )
                    )
                )
            )
        )
    }
}
