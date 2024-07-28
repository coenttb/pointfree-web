//
//  File 2.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 18/06/2022.
//

import Foundation
import HTML

public extension Attribute where Context == HTML.ImageContext {
    static let iconWidth: Self = .width(18)
    static let iconHeight: Self = .height(18)
}
