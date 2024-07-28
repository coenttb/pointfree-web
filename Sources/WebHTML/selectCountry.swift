////
////  File.swift
////  
////
////  Created by Coen ten Thije Boonkkamp on 03-01-2024.
////
//
// import Foundation
// import HTML
// import State
// import ToolKit
//
// extension State {
//    var sort:String {
//        self.name.common.description.lowercased().replacingOccurrences(of: "the ", with: "").replacingOccurrences(of: "de ", with: "").normalized()
//    }
// }
//
// public extension Node<HTML.FormContext>  {
//    
//    static func countrySelect(
//        id: String,
//        label: String,
//        placeholder: String,
//        isSelected:(State.State)->Bool
//    ) -> Self {
//        return .select(
//            id: id,
//            options: State.State.allCases.sorted(by: \.sort).map { (state:State.State) in
//                
//                let value = state.name.common.description
//                let preferredLanguageValue = state.name.common(state.preferredLanguage)
//                
//                let label = (value == preferredLanguageValue)
//                ? value
//                : "\(value) (\(preferredLanguageValue))"
//                
//                return Node<HTML.SelectContext>.option(
////                    .value(state.name.common(state.preferredLanguage)),
////                    .label(state.name.common(state.preferredLanguage))
//
//                    .value(value),
//                    .label(label),
//                    .isSelected(isSelected(state))
//                )
//            }
//        )
//    }
//    
//    static func countryDatalist(
//        id: String,
//        label: String,
//        placeholder: String,
//        isSelected:(State.State)->Bool
//    ) -> Self {
//        return .datalist(
//            id: id,
//            label: label,
//            placeholder: placeholder,
//            options: State.State.allCases.sorted(by: \.sort).map { (state:State.State) in
//                Node<HTML.DataListContext>.option(
////                    .value(state.name.common(state.preferredLanguage)),
////                    .label(state.name.common(state.preferredLanguage)),
//                    .value(state.name.common.description),
//                    .label(state.name.common.description),
//                    .isSelected(isSelected(state))
//                )
//            }
//        )
//    }
// }
