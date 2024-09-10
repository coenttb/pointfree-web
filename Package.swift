// swift-tools-version:5.10.1

import Foundation
import PackageDescription

extension String {
  static let appSecret: Self = "AppSecret"
  static let database: Self = "DatabaseHelpers"
  static let decodableRequest: Self = "DecodableRequest"
  static let emailaddress: Self = "EmailAddress"
  static let favicon: Self = "Favicon"
  static let foundationPrelude: Self = "FoundationPrelude"
  static let gitHub: Self = "GitHub"
  static let httpPipeline: Self = "HttpPipeline"
  static let loggingDependencies: Self = "LoggingDependencies"
  static let mailgun: Self = "Mailgun"
  static let mediaType: Self = "MediaType"
  static let nioDependencies: Self = "NIODependencies"
  static let sitemap: Self = "Sitemap"
  static let urlFormCoding: Self = "UrlFormCoding"
  static let urlFormEncoding: Self = "UrlFormEncoding"
}

extension Target.Dependency {
  static var appSecret: Self { .target(name: .appSecret) }
  static var database: Self { .target(name: .database) }
  static var decodableRequest: Self { .target(name: .decodableRequest) }
  static var emailaddress: Self { .target(name: .emailaddress) }
  static var favicon: Self { .target(name: .favicon) }
  static var foundationPrelude: Self { .target(name: .foundationPrelude) }
  static var gitHub: Self { .target(name: .gitHub) }
  static var httpPipeline: Self { .target(name: .httpPipeline) }
  static var loggingDependencies: Self { .target(name: .loggingDependencies) }
  static var mailgun: Self { .target(name: .mailgun) }
  static var mediaType: Self { .target(name: .mediaType) }
  static var nioDependencies: Self { .target(name: .nioDependencies) }
  static var sitemap: Self { .target(name: .sitemap) }
  static var urlFormEncoding: Self { .target(name: .urlFormEncoding) }
  static var urlFormCoding: Self { .target(name: .urlFormCoding) }
}

extension Target.Dependency {
  static var async_http_client: Self { .product(name: "AsyncHTTPClient", package: "async-http-client") }
  static var crypto: Self { .product(name: "Crypto", package: "swift-crypto") }
  static var cryptor: Self { .product(name: "Cryptor", package: "BlueCryptor") }
  static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
  static var dependenciesMacros: Self { .product(name: "DependenciesMacros", package: "swift-dependencies") }
  static var either: Self { .product(name: "Either", package: "swift-prelude") }
  static var logging: Self { .product(name: "Logging", package: "swift-log") }
  static var nio: Self { .product(name: "NIO", package: "swift-nio") }
  static var nioCore: Self { .product(name: "NIOCore", package: "swift-nio") }
  static var nioEmbedded: Self { .product(name: "NIOEmbedded", package: "swift-nio") }
  static var nioHTTP1: Self { .product(name: "NIOHTTP1", package: "swift-nio") }
  static var nioHTTPCompression: Self { .product(name: "NIOHTTPCompression", package: "swift-nio-extras") }
  static var macroCodableKit: Self { .product(name: "MacroCodableKit", package: "macro-codable-kit") }
  static var memberwiseInit: Self { .product(name: "MemberwiseInit", package: "swift-memberwise-init-macro") }
  static var postgresKit: Self { .product(name: "PostgresKit", package: "postgres-kit") }
  static var optics: Self { .product(name: "Optics", package: "swift-prelude") }
  static var swiftHtml: Self { .product(name: "HTML", package: "swift-html") }
  static var prelude: Self { .product(name: "Prelude", package: "swift-prelude") }
  static var tagged: Self { .product(name: "Tagged", package: "swift-tagged") }
  static var taggedMoney: Self { .product(name: "TaggedMoney", package: "swift-tagged") }
  static var tuple: Self { .product(name: "Tuple", package: "swift-prelude") }
  static var urlRouting: Self { .product(name: "URLRouting", package: "swift-url-routing") }
}

extension [Package.Dependency] {
  static var `default`: Self {
    [
      .package(url: "https://github.com/apple/swift-crypto", from: "3.2.0"),
      .package(url: "https://github.com/apple/swift-nio", from: "2.61.0"),
      .package(url: "https://github.com/apple/swift-nio-extras.git", from: "1.0.0"),
      .package(url: "https://github.com/apple/swift-log", from: "1.5.0"),
      .package(url: "https://github.com/coenttb/swift-html", branch: "main"),
      .package(url: "https://github.com/gohanlon/swift-memberwise-init-macro", from: "0.3.0"),
      .package(url: "https://github.com/IBM-Swift/BlueCryptor.git", from: "1.0.0"),
      .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5"),
      .package(url: "https://github.com/pointfreeco/swift-tagged.git", from: "0.10.0"),
      .package(url: "https://github.com/pointfreeco/swift-url-routing", from: "0.6.0"),
      .package(url: "https://github.com/swift-server/async-http-client", from: "1.19.0"),
      .package(url: "https://github.com/vapor/postgres-kit", from: "2.12.0"),
      .package(url: "https://github.com/mikhailmaslo/macro-codable-kit.git", from: "0.3.0"),
      .package(url: "https://github.com/pointfreeco/swift-prelude.git", branch: "main"),
    ]
  }
}

let package = Package(
  name: "swift-web",
  platforms: [
    .macOS(.v14),
    .iOS(.v16)
  ],
  products: [
    .library(
      name: "Web",
      targets: [
        .appSecret,
        .database,
        .decodableRequest,
        .emailaddress,
        .favicon,
        .foundationPrelude,
        .gitHub,
        .httpPipeline,
        .loggingDependencies,
        .mailgun,
        .mediaType,
        .nioDependencies,
        .sitemap,
        .urlFormEncoding,
        .urlFormCoding,
      ]
    ),
    .library(name: .appSecret, targets: [.appSecret]),
    .library(name: .database, targets: [.database]),
    .library(name: .decodableRequest, targets: [.decodableRequest]),
    .library(name: .emailaddress, targets: [.emailaddress]),
    .library(name: .favicon, targets: [.favicon]),
    .library(name: .foundationPrelude, targets: [.foundationPrelude]),
    .library(name: .gitHub, targets: [.gitHub]),
    .library(name: .loggingDependencies, targets: [.loggingDependencies]),
    .library(name: .httpPipeline, targets: [.httpPipeline]),
    .library(name: .mailgun, targets: [.mailgun]),
    .library(name: .mediaType, targets: [.mediaType]),
    .library(name: .nioDependencies, targets: [.nioDependencies]),
    .library(name: .sitemap, targets: [.sitemap]),
    .library(name: .urlFormCoding, targets: [.urlFormCoding]),
    .library(name: .urlFormEncoding, targets: [.urlFormEncoding]),
  ],
  dependencies: .default,
  targets: [
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
      name: .emailaddress,
      dependencies: [
        .tagged
      ]
    ),
    .target(
      name: .favicon,
      dependencies: [
        .urlRouting,
        .swiftHtml
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
        .mediaType
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
        .appSecret,
        .decodableRequest,
        .dependencies,
        .dependenciesMacros,
        .either,
        .emailaddress,
        .foundationPrelude,
        .httpPipeline,
        .logging,
        .loggingDependencies,
        .memberwiseInit,
        .tagged,
        .urlFormEncoding,
      ]
    ),
    .target(
      name: .mediaType,
      dependencies: [
        .swiftHtml
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
      name: .sitemap,
      dependencies: [
        .memberwiseInit
      ]
    ),
    .testTarget(
      name: .httpPipeline + "Tests",
      dependencies: [
        .httpPipeline
      ]
    )
  ]
  //  swiftLanguageVersions: [.version("6")]
)
