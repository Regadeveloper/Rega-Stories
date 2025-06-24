public struct UserPage: Sendable {
    public let page: Int
    public let totalPages: Int
    public let hasNextPage: Bool
    public let users: [User]

    public init(page: Int, totalPages: Int, hasNextPage: Bool, users: [User]) {
        self.page = page
        self.totalPages = totalPages
        self.hasNextPage = hasNextPage
        self.users = users
    }

}
