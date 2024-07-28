//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 28-12-2023.
//

import Dependencies
import Foundation
import HTML
import Languages
import ToolKit

public extension Node where Context == HTML.BodyContext {

    static func app_jumbotron(
        app_name: String?,
        app_store_link: String? = nil,
        in_development: Bool = false,
        image: String?,
        caption: String,
        contact_us_button: Bool
    ) -> Self {
        return .section(
            .class("container mb-4"),
            .unwrap(image) { image in
                    .div(
                        .class("mx-auto"),
                        .card(
                            contentAlignment: (.bottom, .left),
                            background: .image(image, apply_darkening_gradient: true, max_width: nil, min_height: "416px"),
                            content: .h2(
                                .class("display-5 text-light fw-bold"),
                                .text(caption)
                            )
                        ),
                        .style("max-width:416px;")
                    )
            },
            .unwrap(app_name) { app_name in
                    .div(
                        .class("row gx-4"),
                        .h1(
                            .text(app_name),
                            .class("display-1 text-center mt-2")
                        )
                    )
            },
            .div(
                .unwrap(
                    app_store_link,
                    {
                        app_store_link in
                            .div(
                                .class(
                                    "row d-flex gx-4"
                                ),
                                .div(
                                    .class(
                                        "col-12 mt-2 d-flex align-items-center justify-content-center gap-2"
                                    ),
                                    .app_store_link(
                                        app_store_link
                                    ),
                                    .contact_us_button
                                )
                            )
                    },
                    else: .if(
                        !in_development,
                        .div(
                            .class("col-12 text-center mt-2"),
                            .if(contact_us_button, .contact_us_button)
                        ),
                        else: .div(
                            .class("row d-flex gx-4"),
                            .div(
                                .class("col-12 mt-2 d-flex align-items-center justify-content-center gap-2"),
                                .in_development(),
                                .if(contact_us_button, .contact_us_button)
                            )
                        )
                    )
                )
            )
        )
    }
}
