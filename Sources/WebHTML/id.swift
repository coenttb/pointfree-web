//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 01-04-2024.
//

import Foundation
import HTML

extension Node<HTML.BodyContext> {
    public static func id(_ id: UUID) -> Node<HTML.BodyContext> {
        .id(id.uuidString)
    }
}

extension UUID {
    public static let navbar_main: UUID = .init()
}
