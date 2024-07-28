//
//  File 2.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 02-01-2024.
//

import Dependencies
import Foundation
import HTML
import Languages
import ToolKit

extension Node<HTML.BodyContext> {
    public static func change_your_password(
        post_password: URL,
        current_password_id: String,
        new_password_id: String
    ) -> Self {

        let form_id_password: String = UUID().uuidString
        return .form(
            .id(form_id_password),
            .method(.post),
            .action(post_password.relativePath),
            .h3(
                .text(String.change_your_password.description.capitalizingFirstLetter())
            ),
            .p(
                .text(String.when_you_change_your_password_we_keep_you_logged_in_to_this_device_but_may_log_you_out_from_your_other_devices.description.capitalizingFirstLetter().period)
            ),
            .input(
                type: .password,
                id: current_password_id,
                value: "",
                label: String.current_password.description.capitalizingFirstLetter(),
                placeholder: String.current_password.description,
                required: true,
                autofocus: true,
                autocomplete: "current-password",
                validationLabel: .empty,
                class: "mb-3"
            ),
            .input(
                type: .password,
                id: new_password_id,
                value: "",
                label: String.new_password.description.capitalizingFirstLetter(),
                placeholder: String.new_password.description,
                required: true,
                autofocus: true,
                autocomplete: "new-password",
                validationLabel: .empty,
                class: "mb-3"
            ),
            .button(
                .class("btn btn-primary mb-4"),
                .type(.submit),
                .text(String.change_your_password.description.capitalizingFirstLetter())
            )
        )
    }
}

extension Node<HTML.BodyContext> {
    public static func change_email(
        post_email: URL,
        email_id: String,
        value: String
    ) -> Self {

        let form_id_email: String = UUID().uuidString
        return .form(
            .id(form_id_email),
            .method(.post),
            .action(post_email.relativePath),
            .h3(
                .text(String.current_email.description.capitalizingFirstLetter())
            ),
            .p(
                .text("\(String.your_current_email_address_is.description.capitalizingFirstLetter()) "), .b(.text(value))
            ),
            .input(
                type: .email,
                id: email_id,
                value: value,
                label: String.emailadres.description.capitalizingFirstLetter(),
                placeholder: String.emailadres.description,
                required: true,
                autofocus: true,
                autocomplete: "email",
                validationLabel: .empty,
                class: "mb-3",
                onChange: .submitForm(id: form_id_email)
            )
        )
    }
}

extension String {
    public static func submitForm(id: String) -> Self {
        "document.getElementById('\(id)').submit();"
    }
}
