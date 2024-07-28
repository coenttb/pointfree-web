//
//  File 3.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 28/05/2022.
//

import Dependencies
import Foundation
import HTML
import Languages
import ToolKit

extension Node where Context == HTML.BodyContext {
    public static func request_reset_password_input(
        post_url: URL,
        logo: Node<HTML.BodyContext>,
        password_id: String
    ) -> Self {
        return .ui_container(
            .simpleHeader(
                logo: logo,
                title: String.check_your_mail.description.capitalizingFirstLetter(),
                subtitle: String.we_have_emailed_you_instructions_to_reset_your_password.description.capitalizingFirstLetter().period
            ),
            .div(
                .class("form-request_reset_password_input"),
                .form(
                    .method(.post),
                    .action(post_url.relativePath),
                    .input(
                        type: .password,
                        id: password_id,
                        value: "",
                        label: String.password.description.capitalizingFirstLetter(),
                        placeholder: String.password.description,
                        required: true,
                        autocomplete: "current-password",
                        validationLabel: .empty,
                        class: "mb-4"
                    ),
                    .button(
                        .class("w-100 btn btn-lg btn-primary mb-4"),
                        .type(.submit),
                        .text(String.continue.description.capitalizingFirstLetter())
                    )
                )
            )
        )
    }
}
