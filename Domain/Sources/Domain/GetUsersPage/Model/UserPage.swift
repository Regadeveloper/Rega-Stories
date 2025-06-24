public struct UserPage {
    let page: Int
    let totalPages: Int
    let hasNextPage: Bool
    let users: [User]

    public init(page: Int, totalPages: Int, hasNextPage: Bool, users: [User]) {
        self.page = page
        self.totalPages = totalPages
        self.hasNextPage = hasNextPage
        self.users = users
    }

}
