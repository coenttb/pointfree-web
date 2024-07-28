//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 07-01-2024.
//

import Foundation
import HTML
import Languages
import Translations

extension Node where Context == HTML.BodyContext {
    public static func registration(
        logo: Node<HTML.BodyContext>,
        post_url: URL,
        name_id: String,
        email_id: String,
        password_id: String,
        login_page_url: URL

    ) -> Self {

        return .ui_container(
            .simpleHeader(
                logo: logo,
                title: String.create_your_account.description.capitalizingFirstLetter()
            ),
            .div(
                .class("form-registration"),
                .form(
                    .method(.post),
                    .action(post_url.relativePath),
                    .input(
                        type: .text,
                        id: name_id,
                        value: "",
                        label: String.name.description.capitalizingFirstLetter(),
                        placeholder: String.name.description,
                        required: true,
                        autofocus: true,
                        autocomplete: "name",
                        validationLabel: .empty,
                        class: "mb-3"
                    ),
                    .input(
                        type: .email,
                        id: email_id,
                        value: "",
                        label: String.emailadres.description.capitalizingFirstLetter(),
                        placeholder: String.emailadres.description,
                        required: true,
                        autocomplete: "username",
                        validationLabel: .empty,
                        class: "mb-3"
                    ),
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
                    ),
                    .div(
                        .class("text-center text-muted"),
                        .p(
                            .class(""),
                            .text(String.already_have_an_account.description.capitalizingFirstLetter() + .space),
                            .a(
                                .href(login_page_url.relativePath),
                                .b(.text(String.login.description.capitalizingFirstLetter()))
                            )
                        )
                    )
                )
            )
        )
    }
}
