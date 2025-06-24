public protocol GetUsersPageRepository {
    func getUsersPage(page: Int) async throws -> UserPage
}
