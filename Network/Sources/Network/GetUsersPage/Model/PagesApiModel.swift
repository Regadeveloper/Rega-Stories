public struct UserPageApi: Codable {
    let page: Int
    let totalPages: Int
    let hasNextPage: Bool
    let users: [UserApiModel]

    private enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case hasNextPage = "has_next_page"
        case users
    }
}
