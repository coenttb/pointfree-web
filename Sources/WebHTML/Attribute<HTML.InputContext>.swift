//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 08-02-2024.
//

import Foundation
import HTML

extension Attribute<HTML.InputContext> {
    static func onChange(unsafe javascript: String) -> Self {
        .attribute(named: "onChange", value: javascript)
    }
}
