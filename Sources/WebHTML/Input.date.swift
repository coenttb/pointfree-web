//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 02-01-2024.
//

import Foundation
import HTML
import ToolKit
import URLFormCoding

public extension Node where Context == HTML.FormContext {

    static func date(
        id: String,
        date: Date?,
        label: String,
        placeholder: String = .empty,
        required: Bool = false,
        autofocus: Bool = false,
        autocomplete: String = "",
        validationLabel: Node<HTML.FormContext> = .empty,
        class: String = "",
        onChange javascript: String = ""
    ) -> Self {
        .input(
            type: .date,
            id: id,
            value: date.map(DateFormatter.form.string(from:)) ?? "",
            label: label,
            placeholder: placeholder,
            required: required,
            autofocus: autofocus,
            autocomplete: autocomplete,
            validationLabel: validationLabel,
            class: `class`,
            onChange: javascript
        )
    }
}
