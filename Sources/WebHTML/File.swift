//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 17/05/2024.
//

import Foundation
import Plot

extension Node {
    public static func attributes(_ attributes: [String: String]) -> Self {
        .group(attributes.sorted(by: \.key).map { .attribute(named: $0, value: $1) })
    }
}

extension String {
    public static let submitForm: Self = "\"this.form.submit()\""
}

extension Node<HTML.ButtonContext> {
    public static func modal(_ modal: String) -> Self {
        .attributes([
            "data-bs-toggle": "modal",
            "data-bs-target": "#\(modal)"
        ])
    }
}

extension Node<HTML.BodyContext> {
    public static func tabindex(_ value: Int) -> Node {
        return .attribute(named: "tabindex", value: "\(value)")
    }

    public static func ariaLabelledby(_ value: String) -> Node {
        return .attribute(named: "aria-labelledby", value: value)
    }
}

extension String {
    public static var endOfHTMLJavascript: Self = ""
}

extension Node<HTML.BodyContext> {

    public static func `if`(checkboxid: String, _ content: () -> Self) -> Self {
        let id = UUID().uuidString

        String.endOfHTMLJavascript.append("""
        document.getElementById('\(checkboxid)').addEventListener('change', function() {
            const isInputVisible = this.checked;
            document.getElementById('\(id)').style.display = isInputVisible ? 'block' : 'none';
        });
        """)

        return .div(
            .id(id),
            content(),
            .style("display: none;")
        )
    }

    public static func binding(textInputId: String) -> Self {
        let id = UUID().uuidString

        let const = "\(textInputId)\(id)".replacingOccurrences(of: "-", with: "")

        String.endOfHTMLJavascript.append("""
        const \(const) = document.getElementById('\(textInputId)')
        document.getElementById('\(id)').textContent = \(const).value;
        \(textInputId).addEventListener('input', function() { document.getElementById('\(id)').textContent = this.value; });
        """)

        return .group(
            .id(id)
        )
    }
}
