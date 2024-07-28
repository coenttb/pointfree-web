//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 18-12-2023.
//

import Dependencies
import Foundation
import Languages

public struct AppColor: Codable, Hashable {
    public let primary: String
    public let secondary: String
    public let tertiary: String
    public let accent: String
    public let bg_light: String
    public let bg_dark: String

    public init(primary: String, secondary: String, tertiary: String, accent: String, bg_light: String, bg_dark: String) {
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
        self.accent = accent
        self.bg_light = bg_light
        self.bg_dark = bg_dark
    }
}

extension AppColor: TestDependencyKey {
    public static let testValue: AppColor = AppColor.default
}

extension DependencyValues {
    public var appColor: AppColor {
        get { self[AppColor.self] }
        set { self[AppColor.self] = newValue }
    }
}

public extension AppColor {
    static let `default`: AppColor = .init(
        primary: "rgb(244, 244, 249)",
        secondary: "rgb(244, 244, 249)",
        tertiary: "rgb(244, 244, 249)",
        accent: "rgb(244, 244, 249)",
        bg_light: "rgb(244, 244, 249)",
        bg_dark: "rgb(244, 244, 249)"
    )
}
