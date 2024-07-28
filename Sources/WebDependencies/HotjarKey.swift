//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 18-12-2023.
//

import Dependencies
import Foundation

private enum HotjarAnalyticsKey: DependencyKey {
    static let liveValue: String = ""
    static let testValue: String = ""
}

extension DependencyValues {
    public var hotjarAnalytics: String {
        get { self[HotjarAnalyticsKey.self] }
        set { self[HotjarAnalyticsKey.self] = newValue }
    }
}
