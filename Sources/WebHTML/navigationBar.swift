//
//  File 3.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 28/05/2022.
//

import Dependencies
import Foundation
import Languages
import ToolKit
import URLRouting

extension Node<HTML.BodyContext> {
    public static func navigationbar (
        logo: (
            picture: Node<HTML.AnchorContext>,
            href: any URLRepresentable
        ),
        items: () async throws -> [Node<HTML.ListContext>]
    ) async throws -> Self {

        return .header(
            .class("navbar navbar-expand-md fixed-top navbar-light"),
            .id("navbar-main-id"),
            .ariaLabel(.navigationbar.description),
            .div(
                .class("container"),
                .a(
                    .href(logo.href),
                    .class("navbar-brand d-flex text-center align-items-center text-muted text-decoration-none"),
                    logo.picture
                ),
                .button(
                    .id("hamburger-menu"),
                    .class("navbar-toggler collapsed"),
                    .type(.button),
                    .data(named: "bs-toggle", value: "collapse"),
                    .data(named: "bs-target", value: "#navbar-id"),
                    .ariaControls("navbar-id"),
                    .ariaExpanded(false),
                    .ariaLabel("Toggle navigation"),
                    .span(.class("navbar-toggler-icon"))
                ),
                .div(
                    .class("collapse navbar-collapse"),
                    .id("navbar-id"),
                    .ul(
                        .class("navbar-nav me-auto mb-2 mb-lg-0"),
                        .group(try await items())
                    )
                    //                    .unwrap(
                    //                        currentUser,
                    //                        {
                    //                            currentUser in
                    //                                .a(
                    //                                    .class("nav-item text-muted nav-link"),
                    //                                    .href(siteRouter.href(for: .account(.details(.index)))),
                    //                                    .small(.text("\(currentUser.name ?? "person")"))
                    //                                )
                    //                        },
                    //                        else: .empty
                    //                    )
                )
            )
        )
    }
}

extension Node<HTML.ListContext> {
    public static func li(
        active: () -> Bool,
        href: any URLRepresentable,
        text: Node<HTML.BodyContext>
    ) -> Self {
        return .li(
            .class("nav-item"),
            .a(
                .class("px-4 text-muted nav-link \(active() ? "active" : "")"),
                .href(href),
                .small(text)
            )
        )
    }
}

extension Node<HTML.BodyContext> {
    public static func dropdown(
        _ items: DropdownItem...
    ) async throws -> Self {

        return .div(
            .class("ml-auto dropdown"),
            .button(
                .class("btn btn-light btn-sm dropdown-toggle"),
                .attributes([
                    "type": "button",
                    "data-bs-toggle": "dropdown",
                    "aria-expanded": "false"
                ]),
                .text("manage")
            ),
            .ul(
                .class("dropdown-menu dropdown-menu-sm-end"),
                .group(items.map { item in
                        .li(.init(item))
                })
            )
        )
    }
}

extension Node<HTML.BodyContext> {
    public init(_ item: DropdownItem) {
        self = switch item {
        case let .link(text: text, url: url, color: color):
                .a(
                    .class("dropdown-item \(color?.rawValue ?? "")"),
                    .href(url),
                    .text(text)
                )
        case .text(text: let text):
                .text(text)
        case .header(text: let text):
                .h6(.class("dropdown-header"), .text(text))
        case .divider:
                .hr(.class("dropdown-divider"))
        }
    }
}

extension Node<HTML.ListContext> {
    public static func breadcrumb(
        href: URLRepresentable,
        text: String
    ) -> Self {

        return .li(
            .class("breadcrumb-item"),
            .a(
                .class("text-muted"),
                .href(href),
                .small(.text(text))
            )
        )
    }
}

public enum DropdownItem {
    case link(text: String, url: URLRepresentable, color: LinkColor? = nil)
    case text(text: String)
    case header(text: String)
    case divider
}

public enum LinkColor: String, Codable, Hashable {
    case primary = "link-primary"
    case secondary = "link-secondary"
    case success = "link-success"
    case danger = "link-danger"
    case warning = "link-warning"
    case info = "link-info"
    case light = "link-light"
    case dark = "link-dark"
}

extension Node<HTML.ListContext> {
    public static func li(
        href: URLRepresentable,
        text: String
    ) -> Self {
        return .li(
            .class("nav-item"),
            .a(
                .class("px-4 text-muted nav-link"),
                .href(href),
                .small(.text(text))
            )
        )
    }
}
