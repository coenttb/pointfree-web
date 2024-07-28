import Foundation

public struct EmailSetting: Decodable, Equatable {
    public var newsletter: Newsletter
    public var userId: UUID

    public init(newsletter: Newsletter, userId: UUID) {
        self.newsletter = newsletter
        self.userId = userId
    }

    public enum Newsletter: String, RawRepresentable, Codable, Equatable, Sendable {
        case announcements
        case newBlogPost
        case newEpisode
        case welcomeEmails

        public static let allNewsletters: [Newsletter] = [
            .announcements,
            .newBlogPost,
            .newEpisode,
            .welcomeEmails
        ]

        public static let subscriberNewsletters: [Newsletter] = [
            .announcements,
            .newBlogPost,
            .newEpisode
        ]
    }
}
