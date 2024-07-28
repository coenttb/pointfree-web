//
//  File 3.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 28/05/2022.
//

import CasePaths
import Dependencies
import Foundation
import HTML
import Languages
import MemberwiseInit
import Translations
import WebDependencies

extension [Node<HTML.HeadContext>] {

    public static func favicon(
        svg: URL,
        appleTouchIcon: URL,
        siteManifest: URL
    ) -> Self {
        [
            .link(.rel(.icon), .href(svg.relativePath)),
            .link(.rel(.maskIcon), .href(svg.relativePath), .color("#000000")),
            .link(.rel(.appleTouchIcon), .href(appleTouchIcon.relativePath)),
            .link(.rel(.manifest), .href(siteManifest.relativePath))
        ]
    }
    
    public static func favicon_old(
        appleTouchIcon: URL?,
        favicon32x32: URL?,
        favicon16x16: URL?,
        siteManifest: URL?,
        safariPinnedTab: URL?
    ) -> Self {
        [
            appleTouchIcon.map { .link(.rel(.appleTouchIcon), .sizes("180x180"), .href($0.relativePath)) } ?? .empty,
            favicon32x32.map { .link(.rel(.icon), .type("image/png"), .sizes("32x32"), .href($0.relativePath)) } ?? .empty,
            favicon16x16.map { .link(.rel(.icon), .type("image/png"), .sizes("16x16"), .href($0.relativePath)) } ?? .empty,
            siteManifest.map { .link(.rel(.manifest), .href($0.relativePath)) } ?? .empty,
            safariPinnedTab.map { .link(.rel(.maskIcon), .href($0.relativePath), .color("#000000")) } ?? .empty,
            .meta(.name("msapplication-TileColor"), .content("#000000"))
        ]
    }
    
    public static func `default`(
        title: Node<HTML.HeadContext> = .empty,
        description: TranslatedString? = nil,
        languages: [Languages.Language],
        hreflang: (Languages.Language) -> URL,
        bootstrap: URL,
        canonical_href: URL?,
        favicon: [Node<HTML.HeadContext>],
        themeColor: String
    ) -> Self {
        @Dependency(\.language) var language
        @Dependency(\.appColor) var appColor
        
        let languageLinks: [Node<HTML.HeadContext>] = languages.removingAllOccurrences(of: language).map { language in
            return Node<HTML.HeadContext>.link(
                .rel(.alternate),
                .hreflang(.init(language: language)),
                .href(hreflang(language))
            )
        }
        
        let custom_nodes: [Node<HTML.HeadContext>] = [
            [
                title,
                .stylesheet(bootstrap.relativePath),
                .meta(
                    .attribute(named: "charset", value: "UTF-8")
                ),
                .unwrap(description) { description in
                        .meta(
                            .attribute(named: "description", value: "\(description)")
                        )
                },
                .meta(
                    //                        .attribute(named: "name", value: "http-equiv"),
                    .attribute(named: "http-equiv", value: "Content-Type"),
                    .attribute(named: "content", value: "text/html; charset=UTF-8")
                ),
                .meta(
                    .attribute(named: "name", value: "viewport"),
                    .attribute(named: "content", value: "width=device-width, initial-scale=1")
                ),
                canonical_href.map { .link(.rel(.canonical), .href($0)) } ?? .empty
            ],
            favicon,
            [
                .meta(
                    .name("theme-color"),
                    .content(appColor.bg_light),
                    .attribute(named: "media", value: "(prefers-color-scheme: light)")
                ),
                .meta(
                    .name("theme-color"),
                    .content(appColor.bg_dark),
                    .attribute(named: "media", value: "(prefers-color-scheme: dark)")
                )
            ]
        ].flatMap { $0 }
        
        return languageLinks + custom_nodes
    }
    
    public static func analytics(
        google_analytics_id: String?,
        hotjar_analytics_id: String?
    ) -> Self {
        [
            google_analytics_id.map { Node<HTML.HeadContext> .google_analytics(id: $0) } ?? .empty,
            hotjar_analytics_id.map { Node<HTML.HeadContext> .hotjar_analytics(id: $0) } ?? .empty
        ]
    }
}

public extension Node<HTML.DocumentContext> {
    
    static func head(
        _ nodes: Node<HTML.HeadContext>...
    ) -> Self {
        
        return .element(
            named: "head",
            nodes: nodes
        )
    }
    
    static func head(
        _ nodes: [Node<HTML.HeadContext>]
    ) -> Self {
        
        return .element(
            named: "head",
            nodes: nodes
        )
    }
    
    static func emailHead(
        title: Node<HTML.HeadContext> = .empty,
        css: String,
        nodes: Node<HTML.HeadContext>...
    ) -> Self {
        
        @Dependency(\.language) var language
        
        let custom_nodes: [Node<HTML.HeadContext>] = [
            title,
            .stylesheet(css),
            .meta(
                .attribute(named: "charset", value: "UTF-8")
            ),
            .meta(
                .attribute(named: "http-equiv", value: "Content-Type"),
                .attribute(named: "content", value: "text/html; charset=UTF-8")
            ),
            .meta(
                .attribute(named: "name", value: "viewport"),
                .attribute(named: "content", value: "width=device-width, initial-scale=1")
            )
        ]
        
        return .element(
            named: "head",
            nodes: (
                custom_nodes
            )
        )
    }
}

public struct LoginWithApple {
    
}

extension LoginWithApple {
    public enum Scope: String {
        case name = "name"
        case email = "email"
    }
}

extension LoginWithApple {
    @MemberwiseInit(.public)
    public struct Response: Codable, Hashable {
        public let authorization: Authorization
        public let user: LoginWithApple.Response.User
        
        @MemberwiseInit(.public)
        public struct Authorization: Codable, Hashable {
            public let code: String
            public let id_token: JSONWebToken
            public let state: String
            
            @MemberwiseInit(.public)
            public struct JSONWebToken: Codable, Hashable, RawRepresentable {
                public let rawValue: String
            }
        }
        @MemberwiseInit(.public)
        public struct User: Codable, Hashable {
            public let name: Name
            public let email: String
            
            @MemberwiseInit(.public)
            public struct Name: Codable, Hashable {
                public let firstName: String
                public let lastName: String
                
            }
        }
        
        @MemberwiseInit(.public)
        public struct Error: Codable, Hashable {
            public let error: Error.Code
            public let state: String
            
            public enum Code: String, Codable, Hashable {
                case user_cancelled_authorize = "user_cancelled_authorize"
            }
        }
    }
    public typealias Javascript = String
}

extension [Node<HTML.HeadContext>] {
    public static func login_with_apple(
        client_id: String,
        scopes: [LoginWithApple.Scope],
        redirect: URL,
        state: String,
        nonce: String,
        use_popup: (AppleIDSignInOnSuccess: LoginWithApple.Javascript, AppleIDSignInOnFailure: LoginWithApple.Javascript)? = nil
    ) -> Self {
        .login_with_apple(
            client_id: client_id,
            scope: scopes.map(\.rawValue).joined(separator: " "),
            redirect: redirect.absoluteString,
            state: state,
            nonce: nonce,
            use_popup: use_popup
        )
    }
    
    static func login_with_apple(
        client_id: String,
        scope: String,
        redirect: String,
        state: String,
        nonce: String,
        use_popup: (AppleIDSignInOnSuccess: LoginWithApple.Javascript, AppleIDSignInOnFailure: LoginWithApple.Javascript)?
    ) -> Self {
        [
            .unwrap(use_popup) { (AppleIDSignInOnSuccess, AppleIDSignInOnFailure) in
                    .script(.raw(
                        """
                        document.addEventListener('AppleIDSignInOnSuccess', (event) => {
                            \(AppleIDSignInOnSuccess)
                        });
                        
                        
                        // Listen for authorization failures.
                        document.addEventListener('AppleIDSignInOnFailure', (event) => {
                             \(AppleIDSignInOnFailure)
                        });
                        """)
                    )
            },
            .meta(.name("appleid-signin-client-id"), .content(client_id)),
            .meta(.name("appleid-signin-scope"), .content(scope)),
            .meta(.name("appleid-signin-redirect-uri"), .content(redirect)),
            .meta(.name("appleid-signin-state"), .content(state)),
            .meta(.name("appleid-signin-nonce"), .content(nonce)),
            .meta(.name("appleid-signin-use-popup"), .content("\(use_popup != nil ? true : false)"))
            
        ]
    }
}

extension Node<HTML.HeadContext> {
    public static func google_analytics(id: String?) -> Self {
        guard
            let id,
            !id.isEmpty
        else { return .empty }
        
        return .raw(
            """
            <!-- Google tag (gtag.js) -->
            <script async src="https://www.googletagmanager.com/gtag/js?id=\(id)"></script>
            <script>
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());
            
              gtag('config', '\(id)');
            </script>
            """
        )
    }
    
    public static func hotjar_analytics(id: String?) -> Self {
        guard
            let id,
            !id.isEmpty
        else { return .empty }
        
        return .raw(
            """
            <!-- Hotjar Tracking Code for https://tenthijeboonkkamp.legal -->
            <script>
                (function(h,o,t,j,a,r){
                    h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
                    h._hjSettings={hjid:\(id),hjsv:6};
                    a=o.getElementsByTagName('head')[0];
                    r=o.createElement('script');r.async=1;
                    r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
                    a.appendChild(r);
                })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
            </script>
            """
        )
    }
}
