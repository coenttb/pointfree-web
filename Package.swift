// swift-tools-version:5.10.1

import Foundation
import PackageDescription

extension String {
    static let pointfreeServer: Self = "PointFree Server"
    static let appSecret: Self = "AppSecret"
    static let database: Self = "DatabaseHelpers"
    static let decodableRequest: Self = "DecodableRequest"
    static let foundationPrelude: Self = "FoundationPrelude"
    static let httpPipeline: Self = "HttpPipeline"
    static let nioDependencies: Self = "NIODependencies"
    static let loggingDependencies: Self = "LoggingDependencies"
}

extension Target.Dependency {
    static var appSecret: Self { .target(name: .appSecret) }
    static var database: Self { .target(name: .database) }
    static var decodableRequest: Self { .target(name: .decodableRequest) }
    static var foundationPrelude: Self { .target(name: .foundationPrelude) }
    static var httpPipeline: Self { .target(name: .httpPipeline) }
    static var nioDependencies: Self { .target(name: .nioDependencies) }
    static var loggingDependencies: Self { .target(name: .loggingDependencies) }
}

extension Target.Dependency {
    static var async_http_client: Self { .product(name: "AsyncHTTPClient", package: "async-http-client") }
    static var crypto: Self { .product(name: "Crypto", package: "swift-crypto") }
    static var cryptor: Self { .product(name: "Cryptor", package: "BlueCryptor") }
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var either: Self { .product(name: "Either", package: "swift-prelude") }
    static var logging: Self { .product(name: "Logging", package: "swift-log") }
    static var nio: Self { .product(name: "NIO", package: "swift-nio") }
    static var nioCore: Self { .product(name: "NIOCore", package: "swift-nio") }
    static var nioEmbedded: Self { .product(name: "NIOEmbedded", package: "swift-nio") }
    static var nioHTTP1: Self { .product(name: "NIOHTTP1", package: "swift-nio") }
    static var nioHTTPCompression: Self { .product(name: "NIOHTTPCompression", package: "swift-nio-extras") }
    static var postgresKit: Self { .product(name: "PostgresKit", package: "postgres-kit") }
    static var optics: Self { .product(name: "Optics", package: "swift-prelude") }
    static var swiftHtml: Self { .product(name: "HTML", package: "swift-html") }
    static var prelude: Self { .product(name: "Prelude", package: "swift-prelude") }
    static var tagged: Self { .product(name: "Tagged", package: "swift-tagged") }
    static var urlRouting: Self { .product(name: "URLRouting", package: "swift-url-routing") }
    static var pointfreeWeb: Self { .product(name: "PointFree Web", package: "pointfree-web") }
    static var mediaType: Self { .product(name: "MediaType", package: "pointfree-web") }
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
    name: "pointfree-server",
    platforms: [
        .macOS(.v14),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: .pointfreeServer,
            targets: [
                .appSecret,
                .database,
                .decodableRequest,
                .foundationPrelude,
                .httpPipeline,
                .nioDependencies,
                .loggingDependencies,
            ]
        ),
        .library(name: .appSecret, targets: [.appSecret]),
        .library(name: .database, targets: [.database]),
        .library(name: .decodableRequest, targets: [.decodableRequest]),
        .library(name: .foundationPrelude, targets: [.foundationPrelude]),
        .library(name: .httpPipeline, targets: [.httpPipeline]),
        .library(name: .nioDependencies, targets: [.nioDependencies]),
        .library(name: .loggingDependencies, targets: [.loggingDependencies]),
    ],
    dependencies: .default,
    targets: [
        .target(
            name: .loggingDependencies,
            dependencies: [
                .dependencies
            ]
        ),
        .target(
            name: .appSecret,
            dependencies: [
                .tagged
            ]
        ),
        .target(
            name: .database,
            dependencies: [
                .tagged,
                .postgresKit
            ]
        ),
        .target(
            name: .decodableRequest,
            dependencies: [
                .tagged
            ]
        ),
        .target(
            name: .foundationPrelude,
            dependencies: [
                .nioDependencies,
                .async_http_client,
                .dependencies,
                .either,
                .logging,
                .pointfreeWeb,
                .tagged,
                .loggingDependencies
            ]
        ),
        .target(
            name: .httpPipeline,
            dependencies: [
                .nioCore,
                .nioHTTP1,
                .nioHTTPCompression,
                .crypto,
                .cryptor,
                .optics,
                .prelude,
                .pointfreeWeb,
            ]
        ),
        .target(
            name: .nioDependencies,
            dependencies: [
                .nioCore,
                .nioEmbedded,
                .dependencies
            ]
        ),
        .testTarget(
            name: .httpPipeline + "Tests",
            dependencies: [
                .httpPipeline
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
