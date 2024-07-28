//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 10-01-2024.
//

import Foundation
import HTML

public extension Node where Context == HTML.FormContext {
    static func action(_ url: URL) -> Node {
        return Self.action(url.relativePath)
    }
}
