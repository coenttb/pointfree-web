import Foundation
import Vapor

public struct VaporDocCMiddleware: Middleware {
    public let archivePath: URL
    public let redirectRoot: String?
    public let redirectMissingTrailingSlash: Bool
    private let prefix: String = "/"
    
    public init(archivePath: URL, redirectRoot: String? = nil, redirectMissingTrailingSlash: Bool = false) {
        self.archivePath = archivePath
        self.redirectRoot = redirectRoot
        self.redirectMissingTrailingSlash = redirectMissingTrailingSlash
    }
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        guard var path = request.url.path.removingPercentEncoding else {
            return request.eventLoop.makeFailedFuture(Abort(.badRequest))
        }
        
        guard !path.contains("../") else {
            return request.eventLoop.makeFailedFuture(Abort(.forbidden))
        }
        
        guard path.hasPrefix(self.prefix) else {
            return request.eventLoop.makeFailedFuture(Abort(.forbidden))
        }
        
        if path == self.prefix, let redirectRoot = redirectRoot {
            return request.eventLoop.makeSucceededFuture(
                request.redirect(to: redirectRoot)
            )
        }
        
        path = String(path.dropFirst(self.prefix.count))
        
        let indexPrefixes = [
            "documentation",
            "tutorials",
        ]
        
        for indexPrefix in indexPrefixes where path.hasPrefix(indexPrefix) {
            if indexPrefixes.contains(path) {
                if redirectMissingTrailingSlash {
                    return request.eventLoop.makeSucceededFuture(
                        request.redirect(to: self.prefix + path + "/")
                    )
                } else {
                    return next.respond(to: request)
                }
            }
            
            return serveStaticFileRelativeToArchive("index.html", request: request)
        }
        
        if path == "data/documentation.json" {
            if FileManager.default.fileExists(atPath: archivePath.appendingPathComponent("data/documentation.json", isDirectory: true).path) {
                return serveStaticFileRelativeToArchive("data/documentation.json", request: request)
            }
            
            request.logger.info("\(self.prefix)data/documentation.json was not found, attempting to find product's JSON in /data/documentation/ directory")
            
            let documentationPath = archivePath.appendingPathComponent("data/documentation", isDirectory: true)
            do {
                let contents = try FileManager.default.contentsOfDirectory(atPath: documentationPath.path)
                guard let productJSON = contents.first(where: { $0.hasSuffix(".json") }) else {
                    return next.respond(to: request)
                }
                
                return serveStaticFileRelativeToArchive("data/documentation/\(productJSON)", request: request)
            } catch {
                return next.respond(to: request)
            }
        }
        
        let staticFiles = [
            "favicon.ico",
            "favicon.svg",
            "theme-settings.json",
            "index/index.json"
        ]
        
        for staticFile in staticFiles where path == staticFile {
            return serveStaticFileRelativeToArchive(staticFile, request: request)
        }
        
        let staticFilePrefixes = [
            "css/",
            "js/",
            "data/",
            "images/",
            "downloads/",
            "img/",
            "videos/",
            "index/"
        ]
        
        for staticFilePrefix in staticFilePrefixes where path.hasPrefix(staticFilePrefix) {
            return serveStaticFileRelativeToArchive(path, request: request)
        }
        
        return next.respond(to: request)
    }
    
    private func serveStaticFileRelativeToArchive(_ staticFilePath: String, request: Request) -> EventLoopFuture<Response> {
        let staticFilePath = archivePath.appendingPathComponent(staticFilePath, isDirectory: false)
        return request.eventLoop.makeSucceededFuture(
            request
                .fileio
                .streamFile(
                    at: staticFilePath.path
                )
        )
    }
}
