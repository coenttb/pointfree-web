//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 03-01-2024.
//

import Foundation
import HTML
import Languages
import Translations

extension Node where Context == HTML.BodyContext {
    public static func login(
        logo: Node<HTML.BodyContext>,
        email_id: String,
        password_id: String,
        request_reset_password: URL,
        post_login: URL,
        registration: URL
    ) -> Self {
        return .ui_container(
            .simpleHeader(
                logo: logo,
                title: String.welcome_back.description.capitalizingFirstLetter(),
                subtitle: ""
            ),
            .div(
                .class("form-login"),
                .form(
                    .method(.post),
                    .action(post_login.relativePath),
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
                    .input(
                        type: .password,
                        id: password_id,
                        value: "",
                        label: String.password.description.capitalizingFirstLetter(),
                        placeholder: String.password.description,
                        required: true,
                        autocomplete: "current-password",
                        validationLabel: .empty,
                        class: "mb-3"
                    ),
                    .div(
                        .class("mb-4"),
                        .a(
                            .href(request_reset_password.relativePath),
                            .text((String.forgot_password.capitalizingFirstLetter() + .questionmark).description)
                        )
                    ),
                    .button(
                        .class("w-100 btn btn-lg btn-primary mb-4"),
                        .type(.submit),
                        .text(String.continue.description.capitalizingFirstLetter())
                    ),
                    .div(
                        .class("text-center text-muted"),
                        .p(
                            .small(.text("\(String.dont_have_an_account.description.capitalizingFirstLetter())? ")),
                            .a(
                                .href(registration.relativePath),
                                .b(.text(String.signup.description.capitalizingFirstLetter()))
                            )
                        )
                    )
                )
            )
        )
    }
}

public extension Node where Context == HTML.BodyContext {
    static func loginFooter(
        privacy_policy: URL,
        terms_of_use: URL
    ) -> Self {

        return .footer(
            .class("mt-auto py-2"),
            .section(
                .class("container footer py-3"),
                .div(
                    .class("row g-3 justify-content-center"),
                    .div(
                        .class("col-auto"),
                        .a(
                            .class("text-muted"),
                            .href(privacy_policy.relativePath),
                            .small(.text(String.privacyPolicy.description.capitalizingFirstLetter()))
                        )
                    ),
                    .div(
                        .class("col-auto"),
                        .span(.class("text-muted"), .text("|"))
                    ),
                    .div(
                        .class("col-auto"),
                        .a(
                            .class("text-muted"),
                            .href(terms_of_use.relativePath),
                            .small(.text(String.terms_of_use.description.capitalizingFirstLetter()))
                        )
                    )
                )
            )
        )
    }
}
