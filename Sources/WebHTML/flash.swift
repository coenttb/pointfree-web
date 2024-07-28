//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 03-01-2024.
//

import Foundation
import HTML
import WebModels

extension Node<HTML.BodyContext> {
    public static func flash(flash: Flash) -> Self {

        let alertStyle = switch flash.priority {
        case .error: "alert-danger"
        case .notice: "alert-primary"
        case .warning: "alert-warning"
        }

        return .div(
            .class("alert alert-warning \(alertStyle) alert-dismissible fade show"),
            .style("position: fixed; bottom: 1rem; right: 1rem; max-width: 30rem;"),
            .attribute(named: "role", value: "alert"),
            .text(flash.message),
            .button(
                .class("btn-close"),
                .attribute(named: "data-bs-dismiss", value: "alert"),
                .ariaLabel("Close")
            )
        )
    }
}
