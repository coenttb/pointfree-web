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
    public static func request_reset_password(
        post_url: URL,
        login_url: URL,
        logo: Node<HTML.BodyContext>,
        email_id: String
    ) -> Self {
        return .ui_container(
            .simpleHeader(
                logo: logo,
                title: String.reset_your_password.description.capitalizingFirstLetter(),
                subtitle: ""
            ),
            .div(
                .class("form-request_reset_password"),
                .form(
                    .method(.post),
                    .action(post_url.relativePath),
                    .small(
                        .class("text-muted text-center"),
                        .p(String.enter_your_email_address_and_we_will_send_you_instructions_to_reset_your_password.description.capitalizingFirstLetter().period)
                    ),
                    .input(
                        type: .email,
                        id: email_id,
                        value: "",
                        label: String.emailadres.description.capitalizingFirstLetter(),
                        placeholder: String.emailadres.description,
                        required: true,
                        autofocus: true,
                        autocomplete: "username",
                        validationLabel: .empty,
                        class: "mb-3"
                    ),
                    .button(
                        .class("w-100 btn btn-lg btn-primary mb-4"),
                        .type(.submit),
                        .text(String.continue.description.capitalizingFirstLetter())
                    ),
                    .div(
                        .class("text-center text-muted"),
                        .p(
                            .class(""),
                            .small(.text("\(String.dont_have_an_account.description.capitalizingFirstLetter())? ")),
                            .a(
                                .href(login_url.relativePath),
                                .text(String.signup.description.capitalizingFirstLetter())
                            )
                        )
                    )
                )
            )
        )
    }
}
