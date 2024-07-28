//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 07-01-2024.
//

import Foundation
import HTML
import Languages
import ToolKit

extension Node where Context == HTML.BodyContext {
    public static func choose_country_region(
        language: Languages.Language,
        languages: [Languages.Language],
        is_active: (Languages.Language) -> Bool,
        href: (Languages.Language) -> URL
    ) -> Self {

        return .ul(
            .class("list-group"),
            .forEach(languages) { language in
                    .li(
                        .class("text-primary list-group-item \(is_active(language) ? "active" : "")"),
                        .a(
                            .class("\(is_active(language) ? "text-light" : "text-primary")"),
                            .attribute(named: "aria-current", value: "page"),
                            .href(href(language).relativePath),
                            .text("\(language.icon) \(language.name(language).capitalizingFirstLetter())")
                        )
                    )
            }
        )
    }
}

public extension Languages.Language {
    var icon: String {
        switch self {
        case .dutch: return "🇳🇱"
        case .english: return "🇺🇸"
        case .german: return "🇩🇪"
        case .french: return "🇫🇷"
        case .spanish: return "🇪🇸"
        default: return "nil"
        }
    }
}
