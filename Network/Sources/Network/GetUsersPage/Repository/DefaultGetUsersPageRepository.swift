import Domain

public struct DefaultGetUsersPageRepository: GetUsersPageRepository {
    private let getUsersPageDataSource: GetUsersPageDataSource

    public func getUsersPage(page: Int) async throws -> UserPage {
        getUsersPageDataSource.getUsersPageDataSource(page: page)
    }
    
}
