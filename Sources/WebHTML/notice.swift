//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 06-01-2024.
//

import Dependencies
import Foundation
import HTML
import Languages

extension Node where Context == HTML.BodyContext {
    public static func notice(
        logo: Node<HTML.BodyContext>,
        title: String = "",
        subtitle: String = "",
        view: Node<HTML.BodyContext>
    ) -> Self {
        return .reading_container(
            .simpleHeader(
                logo: logo,
                title: title,
                subtitle: subtitle
            ),
            .div(
                view
            )
        )
    }
}
