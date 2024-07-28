import Fluent
import Vapor

extension User {
    public final class Token: Model, Content, @unchecked Sendable {
        public static let schema = "user_tokens"

        @ID(key: .id)
        public var id: UUID?

        @Field(key: FieldKeys.value)
        public var value: String

        @OptionalField(key: FieldKeys.validUntil)
        public var validUntil: Date?

        @Parent(key: FieldKeys.userId)
        public var user: User

        public enum FieldKeys {
            public static let value: FieldKey = .init(stringLiteral: "value")
            public static let validUntil: FieldKey = .init(stringLiteral: "valid_until")
            public static let userId: FieldKey = .init(stringLiteral: "user_id")
        }

        public init() { }

        public init(id: UUID? = nil, value: String, validUntil: Date? = nil, userID: User.IDValue) {
            self.id = id
            self.validUntil = validUntil
            self.value = value
            self.$user.id = userID
        }
    }
}

extension User.Token: ModelTokenAuthenticatable {
    public typealias User = WebModels.User
    public static var valueKey: KeyPath<User.Token, Field<String>> {
        \WebModels.User.Token.$value
    }

    public static var userKey: KeyPath<User.Token, Parent<User>> {
        \WebModels.User.Token.$user
    }

//    public static let valueKey = \WebModels.User.Token.$value
//    public static let userKey = \WebModels.User.Token.$user

    public var isValid: Bool {
        self.validUntil.map { Date.now < $0 } ?? true
    }
}

extension User.Token {
    public struct SetupMigration: AsyncMigration {

        public init() {}

        public func prepare(on database: FluentKit.Database) async throws {
            try await database.schema(User.Token.schema)
                .id()
                .field(User.Token.FieldKeys.value, .string, .required)
                .field(User.Token.FieldKeys.userId, .uuid, .required, .references(User.schema, .id))
                .field(User.Token.FieldKeys.validUntil, .date)
                .unique(on: User.Token.FieldKeys.value)
                .create()
        }

        public func revert(on database: Database) async throws {
            try await database.schema(User.Token.schema).delete()
        }
    }
}
