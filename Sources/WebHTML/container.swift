//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 06-01-2024.
//

import Foundation
import HTML

public enum ContainerVariant {
    case node(Node<HTML.BodyContext>)
    case ui(Node<HTML.BodyContext>)
    case code(String)
    case reading(Node<HTML.BodyContext>)
    case narrow(Node<HTML.BodyContext>)
}

extension Node<HTML.BodyContext> {
    public static func container(_ variant: ContainerVariant) -> Self {
        switch variant {
        case let .node(value):
            return .container(value)
        case let .reading(value):
            return .reading_container(value)
        case let .ui(value):
            return .ui_container(value)
        case let .code(value):
            return .code_container(value)
        case let .narrow(value):
            return .narrow_container(value)
        }
    }
}

extension Node<HTML.BodyContext> {
    public static func container(_ nodes: Node<HTML.BodyContext>...) -> Self {
        .div(
            .class("container"),
            .group(nodes)
        )
    }
}

extension Node<HTML.BodyContext> {
    public static func narrow_container(class: String = "mb-2", _ nodes: Node<HTML.BodyContext>...) -> Self {
        .div(
            .class("container \(`class`) class ui_container"),
            .div(
                .class("row"),
                .div(
                    .class("col-lg-10 offset-lg-1 col-xl-8 offset-xl-2 col-xxl-6 offset-xxl-3"),
                    .group(nodes)
                )
            )
        )
    }
}

extension Node<HTML.BodyContext> {
    public static func ui_container(class: String = "mb-2", _ nodes: Node<HTML.BodyContext>...) -> Self {
        .div(
            .class("container \(`class`) class ui_container"),
            .div(
                .class("row"),
                .div(
                    .class("col-lg-10 offset-lg-1 col-xl-8 offset-xl-2 col-xxl-6 offset-xxl-3"),
                    .group(nodes)
                )
            )
        )
    }
}

extension Node<HTML.BodyContext> {
    public static func reading_container(class: String = "mb-2", _ nodes: Node<HTML.BodyContext>...) -> Self {
        .div(
            .class("container \(`class`) class reading_container"),
            .div(
                .class("row"),
                .div(
                    .class("col-lg-10 offset-lg-1 col-xl-8 offset-xl-2 col-xxl-6 offset-xxl-3"),
                    .style("max-width: 21.6cm;"),
                    .group(nodes)
                )
            )
        )
    }
}

extension Node<HTML.BodyContext> {
    public static func code_container(_ code: String) -> Self {
        .div(
            .class("container code_container"),
            .div(
                .class("row"),
                .div(
                    .class("col-lg-10 offset-lg-1 col-xl-8 offset-xl-2"),
                    .codeBlock(code)
                )
            )
        )
    }
}
