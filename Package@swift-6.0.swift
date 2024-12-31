// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let pointfreeWeb: Self = "PointFree Web"
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
            .package(url: "https://github.com/apple/swift-crypto", from: "3.2.0"),
            .package(url: "https://github.com/apple/swift-nio", from: "2.61.0"),
            .package(url: "https://github.com/apple/swift-nio-extras.git", from: "1.0.0"),
            .package(url: "https://github.com/apple/swift-log", from: "1.5.0"),
            .package(url: "https://github.com/coenttb/pointfree-web", branch: "pointfree-server-extraction"),
            .package(url: "https://github.com/IBM-Swift/BlueCryptor.git", from: "1.0.0"),
            .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5"),
            .package(url: "https://github.com/pointfreeco/swift-tagged.git", from: "0.10.0"),
            .package(url: "https://github.com/pointfreeco/swift-url-routing", from: "0.6.0"),
            .package(url: "https://github.com/swift-server/async-http-client", from: "1.19.0"),
            .package(url: "https://github.com/vapor/postgres-kit", from: "2.12.0"),
            .package(url: "https://github.com/pointfreeco/swift-prelude.git", branch: "main"),
        ]
    }
}

let package = Package(
    name: "pointfree-web",
    platforms: [
        .macOS(.v14),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: .pointfreeWeb,
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
        .testTarget(
            name: .httpPipeline + "Tests",
            dependencies: [
                .httpPipeline
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)
