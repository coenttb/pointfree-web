// swift-tools-version:5.10.1

import Foundation
import PackageDescription

extension String {
    static let database: Self = "WebDatabase"
    static let decodableRequest: Self = "DecodableRequest"
    static let emailaddress: Self = "EmailAddress"
    static let faviconRouter: Self = "FaviconRouter"
    static let foundationPrelude: Self = "FoundationPrelude"
    static let gitHub: Self = "GitHub"
    static let httpPipeline: Self = "HttpPipeline"
    static let loggingDependencies: Self = "LoggingDependencies"
    static let mailgun: Self = "Mailgun"
    static let nioDependencies: Self = "NIODependencies"
//    static let webHTML: Self = "WebHTML"
    static let webDependencies: Self = "WebDependencies"
//    static let webModels: Self = "WebModels"
    static let sitemap: Self = "Sitemap"
    static let translations: Self = "Translations"
    static let urlFormCoding: Self = "URLFormCoding"
    static let urlFormEncoding: Self = "UrlFormEncoding"
    static let vaporExtensions: Self = "VaporExtensions"
}

extension Target.Dependency {
    static let database: Self = .target(name: .database)
    static let decodableRequest: Self = .target(name: .decodableRequest)
    static let emailaddress: Self = .target(name: .emailaddress)
    static let faviconRouter: Self = .target(name: .faviconRouter)
    static let foundationPrelude: Self = .target(name: .foundationPrelude)
    static let gitHub: Self = .target(name: .gitHub)
    static let httpPipeline: Self = .target(name: .httpPipeline)
    static let loggingDependencies: Self = .target(name: .loggingDependencies)
    static let mailgun: Self = .target(name: .mailgun)
    static let nioDependencies: Self = .target(name: .nioDependencies)
//    static let webHTML: Self = .target(name: .webHTML)
    static let webDependencies: Self = .target(name: .webDependencies)
//    static let webModels: Self = .target(name: .webModels)
    static let sitemap: Self = .target(name: .sitemap)
    static let translations: Self = .target(name: .translations)
    static let urlFormEncoding: Self = .target(name: .urlFormEncoding)
    static let urlFormCoding: Self = .target(name: .urlFormCoding)
    static let vaporExtensions: Self = .target(name: .vaporExtensions)
}

extension Target.Dependency {
    static let async_http_client: Self = .product(name: "AsyncHTTPClient", package: "async-http-client")
    static let crypto: Self = .product(name: "Crypto", package: "swift-crypto")
    static let cryptor: Self = .product(name: "Cryptor", package: "BlueCryptor")
    static let dependencies: Self = .product(name: "Dependencies", package: "swift-dependencies")
    static let dependenciesMacros: Self = .product(name: "DependenciesMacros", package: "swift-dependencies")
    static let either: Self = .product(name: "Either", package: "swift-prelude")
    static let fluent: Self = .product(name: "Fluent", package: "fluent")
//    static let htmlPointFree: Self = .product(
//        name: "Html",
//        package: "swift-html",
//        moduleAliases: ["Html": "HtmlPointFree"]
////        moduleAliases: ["HtmlPointFree": "Html"]
//    )
    static let language: Self = .product(name: "Languages", package: "swift-language")
    static let logging: Self = .product(name: "Logging", package: "swift-log")
    static let nio: Self = .product(name: "NIO", package: "swift-nio")
    static let nioCore: Self = .product(name: "NIOCore", package: "swift-nio")
    static let nioEmbedded: Self = .product(name: "NIOEmbedded", package: "swift-nio")
    static let nioHTTP1: Self = .product(name: "NIOHTTP1", package: "swift-nio")
    static let nioHTTPCompression: Self = .product(name: "NIOHTTPCompression", package: "swift-nio-extras")
    static let macroCodableKit: Self = .product(name: "MacroCodableKit", package: "macro-codable-kit")
    static let memberwiseInit: Self = .product(name: "MemberwiseInit", package: "swift-memberwise-init-macro")
    static let postgresKit: Self = .product(name: "PostgresKit", package: "postgres-kit")
    static let optics: Self = .product(name: "Optics", package: "swift-prelude")
    static let html: Self = .product(name: "HTML", package: "swift-html")
    static let prelude: Self = .product(name: "Prelude", package: "swift-prelude")
    static let tagged: Self = .product(name: "Tagged", package: "swift-tagged")
    static let taggedMoney: Self = .product(name: "TaggedMoney", package: "swift-tagged")
    static let toolkit: Self = .product(name: "ToolKit", package: "toolkit")
    static let tuple: Self = .product(name: "Tuple", package: "swift-prelude")
    static let urlRouting: Self = .product(name: "URLRouting", package: "swift-url-routing")
    static let vapor: Self = .product(name: "Vapor", package: "vapor")
    static let vaporRouting: Self = .product(name: "VaporRouting", package: "vapor-routing")
    static let xcTestDynamicOverlay: Self = .product(name: "IssueReporting", package: "swift-issue-reporting")
//    static let state: Self = .product(name: "State", package: "state")

}

let package = Package(
    name: "web",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(name: .database, targets: [.database]),
        .library(name: .decodableRequest, targets: [.decodableRequest]),
        .library(name: .emailaddress, targets: [.emailaddress]),
        .library(name: .faviconRouter, targets: [.faviconRouter]),
        .library(name: .foundationPrelude, targets: [.foundationPrelude]),
        .library(name: .gitHub, targets: [.gitHub]),
        .library(name: .loggingDependencies, targets: [.loggingDependencies]),
        .library(name: .httpPipeline, targets: [.httpPipeline]),
        .library(name: .mailgun, targets: [.mailgun]),
        .library(name: .nioDependencies, targets: [.nioDependencies]),
        .library(name: .webDependencies, targets: [.webDependencies]),
        .library(name: .sitemap, targets: [.sitemap]),
        .library(name: .translations, targets: [.translations]),
        .library(name: .urlFormCoding, targets: [.urlFormCoding]),
        .library(name: .urlFormEncoding, targets: [.urlFormEncoding]),
        .library(name: .vaporExtensions, targets: [.vaporExtensions])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto", from: "3.2.0"),
        .package(url: "https://github.com/apple/swift-nio", from: "2.61.0"),
        .package(url: "https://github.com/apple/swift-nio-extras.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-log", from: "1.5.0"),
        .package(url: "https://github.com/coenttb/swift-html", branch: "main"),
        .package(url: "https://github.com/gohanlon/swift-memberwise-init-macro", from: "0.3.0"),
        .package(url: "https://github.com/IBM-Swift/BlueCryptor.git", from: "1.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5"),
//        .package(url: "https://github.com/pointfreeco/swift-html", from: "0.4.0"),
        .package(url: "https://github.com/pointfreeco/swift-tagged.git", from: "0.10.0"),
        .package(url: "https://github.com/pointfreeco/swift-url-routing", from: "0.6.0"),
        .package(url: "https://github.com/pointfreeco/vapor-routing.git", from: "0.1.3"),
        .package(url: "https://github.com/pointfreeco/swift-issue-reporting", from: "1.2.2"),
        .package(url: "https://github.com/swift-server/async-http-client", from: "1.19.0"),
        .package(url: "https://github.com/vapor/postgres-kit", from: "2.12.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.89.3"),
        .package(url: "https://github.com/mikhailmaslo/macro-codable-kit.git", from: "0.3.0"),
        .package(url: "https://github.com/tenthijeboonkkamp/swift-language.git", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-prelude.git", branch: "main"),
//        .package(url: "https://github.com/tenthijeboonkkamp/html.git", branch: "main"),
        .package(url: "https://github.com/tenthijeboonkkamp/toolkit.git", branch: "main")
    ],
    targets: [
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
            name: .emailaddress,
            dependencies: [
                .tagged
            ]
        ),
        .target(
            name: .faviconRouter,
            dependencies: [
                .urlRouting,
                .vaporRouting
            ]
        ),
        .target(
            name: .foundationPrelude,
            dependencies: [
                .loggingDependencies,
                .nioDependencies,
                .async_http_client,
                .dependencies,
                .either,
                .logging,
                .urlFormEncoding
            ]
        ),
        .target(
            name: .gitHub,
            dependencies: [
                .async_http_client,
                .decodableRequest,
                .dependencies,
                .dependenciesMacros,
                .either,
                .foundationPrelude,
                .logging,
                .memberwiseInit,
                .tagged,
                .emailaddress,
                .xcTestDynamicOverlay
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
//                .htmlPointFree,
                .html,
                .optics,
                .prelude
            ]
        ),
        .target(
            name: .loggingDependencies,
            dependencies: [
                .dependencies
            ]
        ),
        .target(
            name: .mailgun,
            dependencies: [
                .decodableRequest,
                .emailaddress,
                .loggingDependencies,
                .dependencies,
                .dependenciesMacros,
                .httpPipeline,
                .either,
                .logging,
                .memberwiseInit,
                .urlFormEncoding,
                .xcTestDynamicOverlay
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
        .target(
            name: .urlFormCoding,
            dependencies: [
                .dependencies,
                .language,
                .toolkit,
                .urlFormEncoding,
                .urlRouting
            ]
        ),
        .target(
            name: .urlFormEncoding,
            dependencies: [
                .optics,
                .prelude
            ]
        ),
        .target(
            name: .webDependencies,
            dependencies: [
                .dependencies,
                .language,
                .memberwiseInit
            ]
        ),
        .target(
            name: .sitemap,
            dependencies: [
                .memberwiseInit
            ]
        ),
        .target(
            name: .translations,
            dependencies: [
                .language,
                .toolkit
            ]
        ),
        .target(
            name: .vaporExtensions,
            dependencies: [
                .memberwiseInit,
                .vapor,
                .vaporRouting,
                .html,
                .webDependencies,
                .toolkit,
                .loggingDependencies
            ]
        )
    ]
//    swiftLanguageVersions: [.version("6")]
)
