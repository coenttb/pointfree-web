// swift-tools-version:5.10.1

import Foundation
import PackageDescription

extension String {
  static let appSecret: Self = "AppSecret"
  static let database: Self = "WebDatabase"
  static let decodableRequest: Self = "DecodableRequest"
  static let emailaddress: Self = "EmailAddress"
  static let faviconRouter: Self = "FaviconRouter"
  static let foundationPrelude: Self = "FoundationPrelude"
  static let gitHub: Self = "GitHub"
  static let webHtml: Self = "Web HTML"
  static let httpPipeline: Self = "HttpPipeline"
  static let loggingDependencies: Self = "LoggingDependencies"
  static let mailgun: Self = "Mailgun"
  static let nioDependencies: Self = "NIODependencies"
  static let sitemap: Self = "Sitemap"
  static let urlFormCoding: Self = "URLFormCoding"
  static let urlFormEncoding: Self = "UrlFormEncoding"
  static let vaporExtensions: Self = "VaporExtensions"
}

extension Target.Dependency {
  static var appSecret: Self { .target(name: .appSecret) }
  static var database: Self { .target(name: .database) }
  static var decodableRequest: Self { .target(name: .decodableRequest) }
  static var emailaddress: Self { .target(name: .emailaddress) }
  static var faviconRouter: Self { .target(name: .faviconRouter) }
  static var foundationPrelude: Self { .target(name: .foundationPrelude) }
  static var gitHub: Self { .target(name: .gitHub) }
  static var webHtml: Self { .target(name: .webHtml) }
  static var httpPipeline: Self { .target(name: .httpPipeline) }
  static var loggingDependencies: Self { .target(name: .loggingDependencies) }
  static var mailgun: Self { .target(name: .mailgun) }
  static var nioDependencies: Self { .target(name: .nioDependencies) }
  static var sitemap: Self { .target(name: .sitemap) }
  static var urlFormEncoding: Self { .target(name: .urlFormEncoding) }
  static var urlFormCoding: Self { .target(name: .urlFormCoding) }
  static var vaporExtensions: Self { .target(name: .vaporExtensions) }
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
  static var vapor: Self { .product(name: "Vapor", package: "vapor") }
  static var vaporRouting: Self { .product(name: "VaporRouting", package: "vapor-routing") }
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
        .faviconRouter,
        .foundationPrelude,
        .gitHub,
        .httpPipeline,
        .loggingDependencies,
        .mailgun,
        .nioDependencies,
        .sitemap,
        .urlFormEncoding,
        .urlFormCoding,
        .vaporExtensions,
      ]
    ),
    .library(name: .database, targets: [.database]),
    .library(name: .decodableRequest, targets: [.decodableRequest]),
    .library(name: .emailaddress, targets: [.emailaddress]),
    .library(name: .faviconRouter, targets: [.faviconRouter]),
    .library(name: .foundationPrelude, targets: [.foundationPrelude]),
    .library(name: .gitHub, targets: [.gitHub]),
    .library(name: .loggingDependencies, targets: [.loggingDependencies]),
    .library(name: .webHtml, targets: [.webHtml]),
    .library(name: .httpPipeline, targets: [.httpPipeline]),
    .library(name: .mailgun, targets: [.mailgun]),
    .library(name: .nioDependencies, targets: [.nioDependencies]),
    .library(name: .sitemap, targets: [.sitemap]),
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
    .package(url: "https://github.com/pointfreeco/swift-tagged.git", from: "0.10.0"),
    .package(url: "https://github.com/pointfreeco/swift-url-routing", from: "0.6.0"),
    .package(url: "https://github.com/pointfreeco/vapor-routing.git", from: "0.1.3"),
    .package(url: "https://github.com/swift-server/async-http-client", from: "1.19.0"),
    .package(url: "https://github.com/vapor/postgres-kit", from: "2.12.0"),
    .package(url: "https://github.com/vapor/vapor.git", from: "4.89.3"),
    .package(url: "https://github.com/mikhailmaslo/macro-codable-kit.git", from: "0.3.0"),
    .package(url: "https://github.com/pointfreeco/swift-prelude.git", branch: "main"),
  ],
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
      ]
    ),
    .target(
      name: .webHtml,
      dependencies: [
        .swiftHtml
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
        .webHtml,
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
    .target(
      name: .vaporExtensions,
      dependencies: [
        .memberwiseInit,
        .vapor,
        .vaporRouting,
        .swiftHtml,
        .loggingDependencies
      ]
    ),
    .testTarget(
      name: .httpPipeline + "Tests",
      dependencies: [
        .httpPipeline
      ]
    )
  ]
  //    swiftLanguageVersions: [.version("6")]
)
