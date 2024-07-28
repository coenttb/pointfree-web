import Dependencies
import Fluent
import Foundation
import Tagged
import Vapor

public final class User: Model, @unchecked Sendable {
    public static let schema = "users"

    @ID(key: .id)
    public var id: UUID?

    @Field(key: FieldKeys.email)
    public var email: String

    @Field(key: FieldKeys.password)
    public var password: String

    @OptionalField(key: FieldKeys.name)
    public var name: String?

    @Timestamp(key: FieldKeys.createdAt, on: .create)
    public var createdAt: Date?

    @Timestamp(key: FieldKeys.updatedAt, on: .update)
    public var updatedAt: Date?

    @Field(key: FieldKeys.isAdmin)
    public var isAdmin: Bool

    @Field(key: FieldKeys.isValidatedViaEmail)
    public var isValidatedViaEmail: Bool

    public enum FieldKeys {
        public static let email: FieldKey = .init(stringLiteral: "email")
        public static let password: FieldKey = .init(stringLiteral: "password")
        public static let name: FieldKey = .init(stringLiteral: "name")
        public static let createdAt: FieldKey = .init(stringLiteral: "created_at")
        public static let updatedAt: FieldKey = .init(stringLiteral: "updated_at")
        public static let isAdmin: FieldKey = .init(stringLiteral: "is_admin")
        public static let isValidatedViaEmail: FieldKey = .init(stringLiteral: "is_email_validated")
    }

    public init() {}

    public init(
        id: UUID? = nil,
        email: String,
        password: String,
        name: String? = nil,
        isAdmin: Bool = false,
        isValidatedViaEmail: Bool = false
    ) {
        self.id = id
        self.email = email
        self.password = password
        self.name = name
        self.isAdmin = isAdmin
        self.isValidatedViaEmail = isValidatedViaEmail
    }
}

extension User {
    public struct SetupMigration: AsyncMigration {

        public init() {}

        public func prepare(on database: Database) async throws {
            try await database.schema(User.schema)
                .id()
                .field(User.FieldKeys.email, .string, .required)
                .unique(on: User.FieldKeys.email)
                .field(User.FieldKeys.password, .string, .required)
                .field(User.FieldKeys.name, .string)
                .field(User.FieldKeys.createdAt, .datetime)
                .field(User.FieldKeys.updatedAt, .datetime)
                .field(User.FieldKeys.isAdmin, .bool)
                .field(User.FieldKeys.isValidatedViaEmail, .bool, .required, .custom("DEFAULT FALSE"))
                .create()
        }

        public func revert(on database: Database) async throws {
            try await database.schema(User.Token.schema).delete()
        }
    }
}

extension User {
    public func generateToken() throws -> User.Token {
        try .init(
            value: UUID().uuidString.lowercased(),
            userID: self.requireID()
        )
    }
}

extension User: ModelAuthenticatable, ModelCredentialsAuthenticatable {
    public static var usernameKey: KeyPath<User, Field<String>> {
        \User.$email
    }

    public static var passwordHashKey: KeyPath<User, Field<String>> {
        \User.$password
    }

//    public static let usernameKey = \User.$email
//    public static let passwordHashKey = \User.$password

    public func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.password) && self.isValidatedViaEmail
    }
}

extension User: ModelSessionAuthenticatable {

}

extension User: SessionAuthenticatable {
    public typealias SessionID = UUID

    public var sessionID: SessionID { id! }

    static func find(id: SessionID, on request: Request) -> EventLoopFuture<User?> {
        return User.find(id, on: request.db)
    }
}
