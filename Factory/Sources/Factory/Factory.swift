import Foundation
import Domain
import Home
import Network

public struct Factory {

    @MainActor public static func createHomeView() -> HomeView {
        return HomeView(viewModel: createHomeViewModel())
    }

    private static func createHomeViewModel() -> HomeViewModel {
        return HomeViewModel(getUsersPageUseCase: createGetUsersPageUseCase())
    }

    private static func createGetUsersPageUseCase() -> GetUsersPageUseCase {
        return DefaultGetUsersPageUseCase(getUsersPageRepository: createGetUsersPageRepository())
    }

    private static func createGetUsersPageRepository() -> GetUsersPageRepository {
        return DefaultGetUsersPageRepository(getUsersPageDataSource: createGetUsersPageDataSource())
    }

    private static func createGetUsersPageDataSource() -> GetUsersPageDataSource {
        return DefaultGetUsersPageDataSource()
    }
}
