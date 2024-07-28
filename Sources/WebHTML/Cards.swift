//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 12/07/2023.
//

import Foundation
import HTML
import Languages
import ToolKit

public extension Node<HTML.BodyContext> {

    enum Color: Codable, Hashable {
        case appBackground
    }

    struct Background: Codable, Hashable {

        let variant: Variant

        let apply_darkening_gradient: Bool

        public enum Variant: Codable, Hashable {
            case image(url: String, max_width: String? = nil, min_height: String? = nil)
            case color(Color)
        }

        public static func image(_ image: String, apply_darkening_gradient: Bool = false, max_width: String? = nil, min_height: String? = nil) -> Self {
            .init(variant: .image(url: image, max_width: max_width, min_height: min_height), apply_darkening_gradient: apply_darkening_gradient)
        }

        public static func color(_ color: Color, apply_darkening_gradient: Bool = false) -> Self {
            .init(variant: .color(color), apply_darkening_gradient: apply_darkening_gradient)
        }
    }

    static func card_title(_ title: String) -> Self {
        .h2(
            .class("h1"),
            .small(
                .class("text-muted fw-light"),
                .text(title)
            )
        )
    }

    static func card(
        background: Background = .color(.appBackground),
        title: String,
        content: Node<HTML.BodyContext>
    ) -> Self {
        .card(
            background: background,
            title: .card_title(title),
            content: content
        )
    }

    static func card(
        background: Background = .color(.appBackground),
        title: String,
        content: String
    ) -> Self {
        .card(
            background: background,
            title: .card_title("\(title)"),
            content: "\(content)"
        )
    }

    static func card(
        background: Background = .color(.appBackground),
        title: Node<HTML.BodyContext>,
        content: Node<HTML.BodyContext>
    ) -> Self {
        .card(background: background, content: .group(
            .if(
                title != .empty,
                title
            ),
            content
        ))
    }

    static func card(
        contentAlignment: (vertical: VerticalAlignment, horizontal: HorizontalAlignment) = (.top, .left),
        background: Background = .color(.appBackground),
        content: Node<HTML.BodyContext>
    ) -> Self {
        let overlay_gradient = background.apply_darkening_gradient ? "overlay-gradient rounded-5" : ""

        var min_height: String {
            switch background.variant {
            case .image(url: _, max_width: _, min_height: let .some(min_height)): return "min-height: \(min_height)"
            default: return ""
            }
        }

        var max_width: String {
            switch background.variant {
            case .image(url: _, max_width: let .some(max_width), min_height: _): return "max-width: \(max_width)"
            default: return ""
            }
        }

        let background_node = switch background.variant {
            case let .image(url, _, _):  Node<HTML.BodyContext>.style("\(min_height); \(String.backgroundImageCSS(url: url))")
            case .color(.appBackground):  Node<HTML.BodyContext>.appBackgroundStyle
        }

//        let background_color:Bool = {
//            if case .color = background.variant {
//                return true
//            }
//            return false
//        }()

        let contentAlignmentClass: String = {
            switch contentAlignment {
            case (.top, .left):
                return ""
            case (.middle, .center):
                return "d-flex align-items-center justify-content-center"
            case (.bottom, .left):
                return "d-flex align-items-end justify-content-start text-left"
            default:
                print(contentAlignment)
                fatalError()
            }
        }()

        let background_image: Bool = {
            if case .image = background.variant {
                return true
            }
            return false
        }()

        return .div(
//            .style("\(max_width); \(min_height);"),
            .class("card rounded-5 border-0 h-100 w-100 "),
            background_node,
            .if(background_image && background.apply_darkening_gradient, .div(.class(overlay_gradient))),
            .div(
                .class("card-body h-100 m-md-2 m-xl-3 mx-md-3 mx-xl-4 \(contentAlignmentClass)"),
                .style("z-index: 3;"),
                content
            )
        )
    }

    static func card_text(_ node: Node<HTML.BodyContext>) -> Self {
        .p(.class("card-text text-primary"), node)
    }
}
