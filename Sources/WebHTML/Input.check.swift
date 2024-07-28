//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 30/05/2022.
//

import Foundation
import HTML

public extension Node where Context == HTML.BodyContext {
    static func check(
        type: HTMLInputType = .text,
        id: String,
        checked: Bool,
        label: String,
        validationLabel: Node<HTML.BodyContext> = .empty
    ) -> Self {
        .div(
            .class("form-check"),
            .input(
                .id(id),
                .name(id),
                .checked(checked),
                .type(.checkbox),
                .value("true"),
                .class("form-check-input")
            ),
            .label(
                .for(id),
                .class("form-check-label"),
                .text(label)
            ),
            .div(
                .class("invalid-feedback"),
                validationLabel
            )
        )
    }

    static func check(
        class: String,
        width: Int,
        height: Int,
        ariaLabel: String = ""
    ) -> Self {
        .element(
            named: "svg",
            nodes: [
                .class(`class`),
                .attribute(named: "width", value: "\(width)"),
                .attribute(named: "height", value: "\(height)"),
                .attribute(named: "role", value: "img"),
                .ariaLabel(ariaLabel),
                .element(named: "use", nodes: [
                    .attribute(named: "xlink:href", value: "#check")
                ])
            ]
        )
    }
}

public extension Node where Context == HTML.FormContext {
    static func check(
        type: HTMLInputType = .text,
        id: String,
        checked: Bool,
        label: String,
        validationLabel: Node<HTML.FormContext> = .empty

    ) -> Self {
        .div(
            .class("form-check"),
            .input(
                .checked(checked),
                .name(id),
//                .attribute(named: "onChange", value: "\"this.form.submit()\""),
                .type(.checkbox),
                .value("true"),
                .class("form-check-input"),
                .id(id)
            ),
            .label(
                .for(id),
                .class("form-check-label"),
                .text(label)
            ),
            .div(
                .class("invalid-feedback"),
                validationLabel
            )
        )
    }
}

public extension Collection {
    func bootstrapColCount() -> Int {
        switch self.count {
        case 0: return 12
        case 1: return 12
        case 2: return 6
        case 3: return 4
        case 4: return 3
        case 5: return 2
        case 6: return 2
        default: fatalError()
        }
    }
}
