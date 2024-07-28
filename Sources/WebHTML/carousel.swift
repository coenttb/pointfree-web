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
import MemberwiseInit
import ToolKit

public extension Node where Context == HTML.BodyContext {

    static func carousel(
        title: Node<HTML.BodyContext>,
        slides: [Slide]
    ) -> Self {
        //        let id:String = UUID().uuidString
        let id: String = "carouselExampleCaptions"
        return .div(
            .id("\(id)"),
            .class("carousel slide"),
            .attribute(named: "data-bs-ride", value: "carousel"),
            .div(
                .class("carousel-indicators"),
                .forEach(slides.enumerated(), { index, _ in
                        .button(
                            .type(.button),
                            .data(named: "bs-target", value: "#\(id)"),
                            .data(named: "bs-slide-to", value: "\(index)"),
                            .class("active"),
                            .attribute(named: "aria-current", value: "true"),
                            .ariaLabel("Slide \(index + 1)")
                        )
                    //                        .button(
                    //                            .type(.button),
                    //                            .data(named: "bs-target", value: "#\(id)"),
                    //                            .data(named: "bs-slide-to", value: "1"),
                    //                            .ariaLabel("Slide 2")
                    //                        ),
                    //                        .button(
                    //                            .type(.button),
                    //                            .data(named: "bs-target", value: "#\(id)"),
                    //                            .data(named: "bs-slide-to", value: "2"),
                    //                            .ariaLabel("Slide 3")
                    //                        )
                })

            ),
            .div(
                .class("carousel-inner"),
                .forEach(slides.enumerated(), { index, slide in
                        .div(
                            .class("carousel-item \(index == 0 ? "active" : "") rounded-5" ),
                            .div(
                                .class("container"),
                                .card( background: slide.background, title: slide.title, content: slide.caption ?? .empty)
                            )
                        )
                })
            ),
            .button(
                .class("carousel-control-prev"),
                .type(.button),
                .data(named: "bs-target", value: "#\(id)"),
                .data(named: "bs-slide", value: "prev"),
                .span(
                    .class("carousel-control-prev-icon"),
                    .ariaHidden(true)
                ),
                .span(
                    .class("visually-hidden"),
                    .text("Previous")
                )
            ),
            .button(
                .class("carousel-control-next"),
                .type(.button),
                .data(named: "bs-target", value: "#\(id)"),
                .data(named: "bs-slide", value: "next"),
                .span(
                    .class("carousel-control-next-icon"),
                    .ariaHidden(true)
                ),
                .span(
                    .class("visually-hidden"),
                    .text("Next")
                )
            )
        )
    }

    static func slide_title(
        title: Node<HTML.BodyContext>,
        href: URL
    ) -> Self {

        return .div(
            .class("row pt-5"),
            .div(
                .class("col-lg-6 rounded-5"),
                .a(
                    .href(href),
                    .h1(
                        .class("display-4 text-light fw-bold"),
                        title
                    )
                )
            )
        )
    }

    static func carousel_section(
        title: Node<HTML.BodyContext>,
        slides: [Slide]
    ) -> Self {
        return .section(
            .class("my-4 bg-dark py-5"),
            .div(
                .class("container text-light mb-4"),
                title
            ),
            .carousel(title: title, slides: slides)
        )
    }
}

@MemberwiseInit(.public)
public struct Slide: Hashable {
    public let title: Node<HTML.BodyContext>
    public let background: Node<HTML.BodyContext>.Background
    public let caption: Node<HTML.BodyContext>?
}
