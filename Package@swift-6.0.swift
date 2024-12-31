// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let pointfreeServer: Self = "PointFree Server"
    static let mediaType: Self = "MediaType"
    static let urlFormEncoding: Self = "UrlFormEncoding"
}

extension Target.Dependency {
    static var mediaType: Self { .target(name: .mediaType) }
    static var urlFormEncoding: Self { .target(name: .urlFormEncoding) }
}

extension Target.Dependency {
    static var optics: Self { .product(name: "Optics", package: "swift-prelude") }
    static var prelude: Self { .product(name: "Prelude", package: "swift-prelude") }
}

extension [Package.Dependency] {
    static var `default`: Self {
        [
            .package(url: "https://github.com/pointfreeco/swift-prelude.git", branch: "main"),
        ]
    }
}

let package = Package(
    name: "pointfree-server",
    platforms: [
        .macOS(.v14),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: .pointfreeServer,
            targets: [
                .mediaType,
                .urlFormEncoding,
            ]
        ),
        .library(name: .mediaType, targets: [.mediaType]),
        .library(name: .urlFormEncoding, targets: [.urlFormEncoding]),
    ],
    dependencies: .default,
    targets: [
        .target(
            name: .mediaType,
            dependencies: [
            ]
        ),
        .target(
            name: .urlFormEncoding,
            dependencies: [
                .optics,
                .prelude
            ]
        ),
    ],
    swiftLanguageModes: [.v5]
)
