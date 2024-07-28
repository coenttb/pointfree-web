import PostgresKit

extension EventLoopGroupConnectionPool where Source == PostgresConnectionSource {
    public var sqlDatabase: SQLDatabase {
        self.database(logger: logger).sql()
    }
}

extension SQLDatabase {
    public func run(_ query: SQLQueryString) async throws {
        try await self.raw(query).run()
    }

    public func all<D: Decodable>(
        _ query: SQLQueryString,
        decoding model: D.Type = D.self
    ) async throws -> [D] {
        try await self.raw(query)
            .all()
            .map { try $0.decode(model: model, keyDecodingStrategy: .convertFromSnakeCase) }
    }

    public func first<D: Decodable>(
        _ query: SQLQueryString,
        decoding model: D.Type = D.self
    ) async throws -> D {
        try await self.raw(query)
            .first()
            .unwrap()
            .decode(model: model, keyDecodingStrategy: .convertFromSnakeCase)
    }
}

extension Optional {
    public struct Nil: Error {}

    public func unwrap() throws -> Wrapped {
        guard let unwrapped = self else { throw Nil() }
        return unwrapped
    }
}

private let logger = Logger(label: "Postgres")
