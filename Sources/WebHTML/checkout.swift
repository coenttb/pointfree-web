//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 30/05/2022.
//

import Foundation
import HTML
import Languages
import Translations

extension Node where Context == HTML.BodyContext {
    public static func checkout(

    ) -> Self {
        .main(
            .class("container"),
            .style("max-width:55em;"),
            .div(
                .class("row g-5"),
                .div(
                    .class("col-md-5 col-lg-4 order-md-last"),
                    .h4(
                        .class("d-flex justify-content-between align-items-center mb-3"),
                        .span(
                            .class("text-primary"),
                            .text("Your cart")
                        ),
                        .span(
                            .class("badge bg-primary rounded-pill"),
                            .text("Your cart")
                        )
                    ),

                        .ul(
                            .class("list-group mb-3"),
                            .li(
                                .class("list-group-item d-flex justify-content-between lh-sm"),
                                .div(
                                    .h6(
                                        .class("my-0"),
                                        .text("Product name")
                                    ),
                                    .small(
                                        .class("text-muted"),
                                        .text("Brief description")
                                    )
                                ),
                                .span(
                                    .class("text-muted"),
                                    .text("$8")
                                )
                            ),
                            .li(
                                .class("list-group-item d-flex justify-content-between lh-sm"),
                                .div(
                                    .h6(
                                        .class("my-0"),
                                        .text("Second product name")
                                    ),
                                    .small(
                                        .class("text-muted"),
                                        .text("Brief description")
                                    )
                                ),
                                .span(
                                    .class("text-muted"),
                                    .text("$12")
                                )
                            ),
                            .li(
                                .class("list-group-item d-flex justify-content-between lh-sm"),
                                .div(
                                    .h6(
                                        .class("my-0"),
                                        .text("Third product name")
                                    ),
                                    .small(
                                        .class("text-muted"),
                                        .text("Brief description")
                                    )
                                ),
                                .span(
                                    .class("text-muted"),
                                    .text("$5")
                                )
                            ),
                            .li(
                                .class("list-group-item d-flex justify-content-between bg-light"),
                                .div(
                                    .class("text-success"),
                                    .h6(
                                        .class("my-0"),
                                        .text("Promo code")
                                    ),
                                    .small(
                                        .class("text-muted"),
                                        .text("EXAMPLECODE")
                                    )
                                ),
                                .span(
                                    .class("text-muted"),
                                    .text("-$5")
                                )
                            ),
                            .li(
                                .class("list-group-item d-flex justify-content-between"),
                                .span(.text("Total (USD)")),
                                .strong(.text("$20"))
                            )
                        ),
                    .form(
                        .class("card p-2"),
                        .div(
                            .class("input-group"),
                            .input(
                                .type(.text),
                                .class("form-control"),
                                .placeholder("Promo code")
                            ),
                            .button(
                                .type(.submit),
                                .class("btn btn-secondary"),
                                .text("Redeem")
                            )
                        )
                    )
                ),
                .div(
                    .class("col-md-7 col-lg-8"),
                    .h4(
                        .class("mb-3"),
                        .text("Billing address")
                    ),
                    .form(
                        .class("needs-validation"),
                        .attribute(named: "novalidate"),
//                        .countrySelect(id: UUID().uuidString, label: "test", placeholder: "search", isSelected: { state in false }),
                        .div(
                            .class("row g-3"),
                            .div(
                                .class("col-sm-6"),
                                .label(
                                    .for("firstName"),
                                    .class("form-label"),
                                    .text("First name")
                                ),
                                .input(
                                    .type(.text),
                                    .class("form-control"),
                                    .id("firstName"),
                                    .placeholder(""),
                                    .value(""),
                                    .required(true)
                                ),
                                .div(
                                    .class("invalid-feedback"),
                                    .text("Valid first name is required")
                                )
                            ),
                            .div(
                                .class("col-sm-6"),
                                .label(
                                    .for("lastName"),
                                    .class("form-label"),
                                    .text("Last name")
                                ),
                                .input(
                                    .type(.text),
                                    .class("form-control"),
                                    .id("lastName"),
                                    .placeholder(""),
                                    .value(""),
                                    .required(true)
                                ),
                                .div(
                                    .class("invalid-feedback"),
                                    .text("Valid last name is required")
                                )
                            ),
                            .div(
                                .class("col-12"),
                                .label(
                                    .for("username"),
                                    .class("form-label"),
                                    .text("Username")
                                ),
                                .div(
                                    .class("input-group has-validation"),
                                    .span(
                                        .class("input-group-text"),
                                        .text("@")
                                    ),
                                    .input(
                                        .type(.text),
                                        .class("form-control"),
                                        .id("username"),
                                        .placeholder("Username"),
                                        .required(true)
                                    ),
                                    .div(
                                        .class("invalid-feedback"),
                                        .text("Valid username is required")
                                    )
                                )
                            ),
                            .div(
                                .class("col-12"),
                                .label(
                                    .for("email"),
                                    .class("form-label"),
                                    .text("Email"),
                                    .span(
                                        .class("text-muted"),
                                        .text("(Optional)")
                                    )
                                ),
                                .div(
                                    .input(
                                        .type(.email),
                                        .class("form-control"),
                                        .id("email"),
                                        .placeholder("you@example.com"),
                                        .required(true)
                                    ),
                                    .div(
                                        .class("invalid-feedback"),
                                        .text("Please enter a valid email address")
                                    )
                                )
                            ),
                            .div(
                                .class("col-12"),
                                .label(
                                    .for("address1"),
                                    .class("form-label"),
                                    .text("Address")
                                ),
                                .div(
                                    .input(
                                        .type(.email),
                                        .class("form-control"),
                                        .id("address1"),
                                        .placeholder("1234 main street"),
                                        .required(true)
                                    ),
                                    .div(
                                        .class("invalid-feedback"),
                                        .text("Please enter a valid address")
                                    )
                                )
                            ),
                            .div(
                                .class("col-12"),
                                .label(
                                    .for("address2"),
                                    .class("form-label"),
                                    .text("Address")
                                ),
                                .div(
                                    .input(
                                        .type(.email),
                                        .class("form-control"),
                                        .id("address2"),
                                        .placeholder("Apartment or suite"),
                                        .required(true)
                                    ),
                                    .div(
                                        .class("invalid-feedback"),
                                        .text("Please enter a valid address")
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    }
}
