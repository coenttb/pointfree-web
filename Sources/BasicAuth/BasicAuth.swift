//
//  File 2.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 01-01-2024.
//

import Dependencies
import Foundation

public struct BasicAuth: Codable, Hashable {
    public var username: String
    public var password: String

  public init(username: String, password: String) {
    self.username = username
    self.password = password
  }
  
    public static let header: String = "Authorization"
}

extension BasicAuth: RawRepresentable {
    public typealias RawValue = String

    public init?(rawValue: RawValue) {
        let components = rawValue.components(separatedBy: ":")
        guard components.count == 2 else { return nil }
        self.username = components[0]
        self.password = components[1]
    }

    public var rawValue: RawValue {
        return "\(username):\(password)"
    }
}

extension BasicAuth: DependencyKey {
    public static let testValue: Self? = nil
    public static let liveValue: Self? = nil
}
