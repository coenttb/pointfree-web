//
//  File 2.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 08/06/2022.
//

import Foundation
import HTML

// public extension Node where Context == HTML.BodyContext {
//    static func select(
//        id:String,
//        options:[Node<HTML.SelectContext>]
//    )->Self {
//        .select(
//            .class("form-select form-select-sm"),
//            .id(id),
//            .attribute(named: "name", value: id),
//            .group(options)
//        )
//    }
// }

public extension Node where Context == HTML.FormContext {
    static func select(
        id: String,
        size: Int = 1,
        options: [Node<HTML.SelectContext>]
    ) -> Self {
        .select(
            .class("form-select form-select-md"),
            .attribute(named: "size", value: "\(size)"),
            .id(id),
            .attribute(named: "name", value: id),
            .group(options)
        )
    }
}

public extension Node where Context == HTML.FormContext {
    static func datalist(
        id: String,
        label: String? = nil,
        placeholder: String? = nil,
        options: [Node<HTML.DataListContext>]
    ) -> Self {

        let idoptions = UUID().uuidString

        return .div(
            .unwrap(label) { label in
                .label(
                    .for(id),
                    .class("form-label"),
                    .text(label)
                )
            },
            .input(
                .class("form-control"),
                .attribute(named: "list", value: idoptions),
                .id(id),
                .attribute(named: "name", value: id),
                .autocomplete(false),
                .unwrap(placeholder) { placeholder in
                    .placeholder(placeholder)
                }
            ),
            .datalist(
                .id(idoptions),
                .group(options)
            )
        )
    }
}
