//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 18-12-2023.
//

import Dependencies
import Foundation

private enum GoogleAnalyticsKey: DependencyKey {
    static let liveValue: String = ""
    static let testValue: String = ""
}

extension DependencyValues {
    public var googleAnalytics: String {
        get { self[GoogleAnalyticsKey.self] }
        set { self[GoogleAnalyticsKey.self] = newValue }
    }
}
