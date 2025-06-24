import Domain
import Foundation

public struct UserViewModel: Identifiable, Equatable, Sendable {
    public let id = UUID()
    public let apiID: Int
    public let name: String
    public let pictureURL: URL
}

extension UserViewModel {
    init(user: User) {
        self.apiID = user.id
        self.name = user.name
        self.pictureURL = URL(string: user.profilePictureURL) ?? URL(string: "https://example.com/placeholder.jpg")!
    }
}

@Observable
public class HomeViewModel {
    let getUsersPageUseCase: GetUsersPageUseCase
    var users: [UserViewModel] = []

    private var currentPage = 1
    private var isFetchingPage = false
    private var canLoadMorePages = true

    public init(getUsersPageUseCase: GetUsersPageUseCase) {
        self.getUsersPageUseCase = getUsersPageUseCase
    }

    @MainActor
    public func loadInitialUsers() async {
        currentPage = 1
        users = []
        canLoadMorePages = true
        await fetchUsers()
    }

    @MainActor
    public func loadMoreUsersIfNeeded(at index: Int) {
        guard !isFetchingPage else { return }

        guard users.indices.contains(index), index == users.count - 2 else {
            return
        }

        Task {
            await fetchUsers()
        }
    }

    @MainActor
    private func fetchUsers() async {
        guard !isFetchingPage, canLoadMorePages else { return }

        isFetchingPage = true

        do {
            let userPage = try await getUsersPageUseCase.getUserPage(page: currentPage)

            if userPage.users.isEmpty {
                canLoadMorePages = false
            } else {
                let newUsers = userPage.users.map { UserViewModel(user: $0) }
                users.append(contentsOf: newUsers)
                currentPage += 1
            }
        } catch {
            print("🔴 Error al obtener la página \(currentPage): \(error)")
        }

        isFetchingPage = false
    }
}
