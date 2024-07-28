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
    static func app_store_link(
        _ app_store_link: String
    ) -> Self {
        .a(
            .href(app_store_link),
            .img(
                .class("rounded-3"),
                .src("/assets/apple/Download_on_the_App_Store-dark-english.svg"),
                .alt("Download \(app_store_link) on the App Store"),
                .width(174),
                .height(58)
            )
        )
    }

    static func link_download_on_the_app_store(
        app_store_link: String,
        _ node: () -> Node<HTML.AnchorContext>
    ) -> Self {
        .a(
            .href(app_store_link),
            .class("text-primary"),
            node()
        )
    }
}
