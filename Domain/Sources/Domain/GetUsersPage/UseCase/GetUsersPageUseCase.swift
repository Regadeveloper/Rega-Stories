protocol GetUsersPageUseCase {
    func getUserPage(page: Int) async throws -> UserPage
}

struct DefaultGetUsersPageUseCase: GetUsersPageUseCase {
    let getUsersPageRepository: GetUsersPageRepository
    func getUserPage(page: Int) async throws -> UserPage {
        try await getUsersPageRepository.getUsersPage(page: page)
    }
}
