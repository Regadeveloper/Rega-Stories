public protocol GetUsersPageUseCase {
    func getUserPage(page: Int) async throws -> UserPage
}

public struct DefaultGetUsersPageUseCase: GetUsersPageUseCase {
    let getUsersPageRepository: GetUsersPageRepository

    public init(getUsersPageRepository: any GetUsersPageRepository) {
        self.getUsersPageRepository = getUsersPageRepository
    }

    public func getUserPage(page: Int) async throws -> UserPage {
        try await getUsersPageRepository.getUsersPage(page: page)
    }
    
}
