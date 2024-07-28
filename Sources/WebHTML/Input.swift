//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 30/05/2022.
//

import Foundation
import HTML
import ToolKit

public extension Node where Context == HTML.FormContext {

    static func input(
        type: HTMLInputType = .text,
        id: String,
        value: String,
        label: String,
        placeholder: String = .empty,
        required: Bool = false,
        autofocus: Bool = false,
        autocomplete: String = "",
        validationLabel: Node<HTML.FormContext> = .empty,
        class: String = "",
        onChange javascript: String = ""
    ) -> Self {
        return .div(
            .class("form-floating \(`class`)"),
            .input(
                .type(type),
                .class("form-control"),
                .id(id),
                !javascript.isEmpty ? .onChange(unsafe: "\(javascript)") : .empty,
                .name(id),
                .placeholder(placeholder),
                .value(value),
                !autocomplete.isEmpty
                    ? .attribute(named: "autocomplete", value: autocomplete)
                    : .empty,
                autofocus
                ? .attribute(named: "autofocus", value: nil)
                : .empty,
                .required(required)
            ),
            .if(!label.isEmpty) {
                .label(
                    .for(id),
                    .class("form-label"),
                    .text(label)
                )
            },
            .if(validationLabel != .empty) {
                .div(
                    .class("invalid-feedback"),
                    validationLabel
                )
            }
        )
    }
}

public extension Node where Context == HTML.BodyContext {
    static func input(
        type: HTMLInputType = .text,
        id: String,
        value: String,
        label: String,
        placeholder: String = .empty,
        required: Bool = false,
        autofocus: Bool = false,
        autocomplete: String = "",
        validationLabel: Node<HTML.BodyContext> = .empty
    ) -> Self {
        return .div(
            .class("form-floating"),
            .input(
                .type(type),
                .class("form-control"),
                .id(id),
                .name(id),
                .placeholder(placeholder),
                .value(value),
                !autocomplete.isEmpty
                    ? .attribute(named: "autocomplete", value: autocomplete)
                    : .empty,
                autofocus
                ? .attribute(named: "autofocus", value: nil)
                : .empty,
                .required(required)
            ),
            .if(!label.isEmpty) {
                .label(
                    .for(id),
                    .class("form-label"),
                    .text(label)
                )
            },
            .if(validationLabel != .empty) {
                .div(
                    .class("invalid-feedback"),
                    validationLabel
                )
            }
        )
    }
}
