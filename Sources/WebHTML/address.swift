//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 29/05/2022.
//
//
// import Foundation
// import LegalKit
//

/// public extension Node where Context == HTML.BodyContext {
//    init(
//        straatnaamId:String,
//        straatnaamValue:String,
//        straatnummerId:String,
//        straatnummerValue:String,
//        postcodeId:String,
//        postcodeValue:String,
//        plaatsId:String,
//        plaatsValue:String
//    ){
//        self = .div(
//            .div(
//                .class("row g-3 mb-3"),
//                .div(
//                    .class("col-lg-9 col-md-7 col-sm-12"),
//                    .input(
//                        id: straatnaamId,
//                        value: straatnaamValue,
//                        label: "Straatnaam"
//                    )
//                ),
//                .div(
//                    .class("col-lg-3 col-md-5 col-sm-12"),
//                    .input(
//                        id: straatnummerId,
//                        value: straatnummerValue,
//                        label: "Nummer"
//                    )
//                )
//            ),
//            .div(
//                .class("row g-3 mb-3"),
//                .div(
//                    .class("col-lg-4 col-md-12"),
//                    .input(
//                        id: postcodeId,
//                        value: postcodeValue,
//                        label: "Postcode"
//                    )
//                ),
//                .div(
//                    .class("col-lg-8 col-md-12"),
//                    .input(
//                        id: plaatsId,
//                        value: plaatsValue,
//                        label: "Plaats"
//                    )
//                )
//            )
//
//        )
//    }
// }
//
// public extension AddressTheNetherlands.Adres {
//
//    func node(
//        address:AddressTheNetherlands.Adres,
//        straatnaamId:String,
//        straatnaamValue:String,
//        straatnummerId:String,
//        straatnummerValue:String,
//        postcodeId:String,
//        postcodeValue:String,
//        plaatsId:String,
//        plaatsValue:String
//    )->Node<HTML.BodyContext> {
//        .init(
//            straatnaamId: straatnaamId,
//            straatnaamValue: straatnaamValue,
//            straatnummerId: straatnummerId,
//            straatnummerValue: straatnummerValue,
//            postcodeId: postcodeId,
//            postcodeValue: postcodeValue,
//            plaatsId: plaatsId,
//            plaatsValue: plaatsValue
//        )
//    }
// }
//
