import Dependencies
import Foundation

public struct Req {
    public let id: String
    public let startTime: Date

    public init(id: String = "", startTime: Date = .now) {
        self.id = id
        self.startTime = startTime
    }
}

private enum RequestKey: DependencyKey {
    static let liveValue: Req = .init()
    static let testValue: Req = .init()
}

extension DependencyValues {
    public var server_request: Req {
        get { self[RequestKey.self] }
        set { self[RequestKey.self] = newValue }
    }
}
