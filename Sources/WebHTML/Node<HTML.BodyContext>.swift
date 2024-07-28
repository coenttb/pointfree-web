//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 13/07/2023.
//

import Foundation
import HTML

public extension Node<HTML.BodyContext> {
    static func appBackgroundStyle(color: String) -> Self {
        .style("--bs-bg-opacity: 1; background-color: \(color); !important;")
    }
    
    static let appBackgroundStyle: Self = .appBackgroundStyle(color: .appBackgroundRGB)
    
    static func backgroundImage(url: String) -> Self {
        .style(String.backgroundImageCSS(url: url))
    }
}
