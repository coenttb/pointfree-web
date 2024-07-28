//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 01-02-2024.
//

import Foundation

extension String {
    public static let prefers_color_scheme_dark: Self = "(prefers-color-scheme: dark)"
    public static let prefers_color_scheme_light: Self = "(prefers-color-scheme: light)"
}

public extension String {
    static let appBackgroundRGB: Self = "rgb(244, 244, 249)"
    static let blueRGB: Self = "rgb(45, 106, 218)"
}

public extension String {
    static func backgroundImageCSS(url: String) -> Self {
        "background-image: url('\(url)'); background-repeat: no-repeat; background-size: cover; background-position-y: center;"
    }
}
