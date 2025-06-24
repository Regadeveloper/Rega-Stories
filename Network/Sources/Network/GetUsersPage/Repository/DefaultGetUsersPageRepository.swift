import Domain

public struct DefaultGetUsersPageRepository: GetUsersPageRepository {
    private let getUsersPageDataSource: GetUsersPageDataSource

    public init(getUsersPageDataSource: any GetUsersPageDataSource) {
        self.getUsersPageDataSource = getUsersPageDataSource
    }

    public func getUsersPage(page: Int) async throws -> UserPage {
        try await getUsersPageDataSource.getUsersPageDataSource(page: page)
    }
    
}
