//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 27-01-2024.
//

import Foundation

extension Node<HTML.BodyContext> {
    public static func modal(
        action: URL,
        inputs: Node<HTML.FormContext>...
    ) -> Self {
        let id = UUID().uuidString
        return .modal(
            action: action,
            body: .form(
                .id(id),
                .method(.post),
                .action(action.relativePath),
                .div(
                    .class("form-group"),
                    .group(inputs)
                )
            ),
            button: .button(
                .class("btn btn-primary"),
                .attributes(["form": id]),
                .type(.submit),
                .text("Proceed")
            )
        )
    }

    public static func modal(
        action: URL,
        body: Node<HTML.BodyContext>...,
        button: Node<HTML.BodyContext>? = nil
    ) -> Self {

        return .div(
            .class("modal fade"),
            .id("addProjectModal"),
            .tabindex(-1),
            .ariaLabelledby("addProjectModalLabel"),
            .ariaHidden(true),

                .div(
                    .class("modal-dialog modal-dialog-centered modal-dialog-scrollable "),
                    .div(
                        .class("modal-content"),
                        .div(
                            .class("modal-header"),
                            .h5(
                                .class("modal-title"),
                                .id("addProjectModalLabel"),
                                .text("New Project")
                            ),
                            .button(
                                .type(.button),
                                .class("btn-close"),
                                .attributes([
                                    "data-bs-dismiss": "modal",
                                    "aria-label": "Close"
                                ])
                            )
                        ),
                        .div(
                            .class("modal-body"),
                            .group(body)
                        ),
                        .div(
                            .class("modal-footer"),
                            .button(
                                .type(.button),
                                .class("btn btn-secondary"),
                                .attributes([
                                    "data-bs-dismiss": "modal"
                                ]),
                                .text("Close")
                            ),
                            .unwrap(button) { button in
                                button
                            }
                        )
                    )
                )
        )
    }
}
