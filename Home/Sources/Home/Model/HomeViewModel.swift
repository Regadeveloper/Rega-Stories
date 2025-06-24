import Domain
import Foundation

public struct UserViewModel: Identifiable, Sendable {
    public let id: Int
    public let name: String
    public let pictureURL: URL
}

@Observable
public class HomeViewModel {
    let getUsersPageUseCase: GetUsersPageUseCase
    var users: [UserViewModel] = []

    public init(getUsersPageUseCase: GetUsersPageUseCase) {
        self.getUsersPageUseCase = getUsersPageUseCase
    }

    func fetchUsers(page: Int) async throws {
        let userPage = try await getUsersPageUseCase.getUserPage(page: page)
        let newUsers = userPage.users.map { UserViewModel(user: $0) }
        users.append(contentsOf: newUsers)
    }
}

extension UserViewModel {
    init(user: User) {
        self.id = user.id
        self.name = user.name
        self.pictureURL = URL(string: user.profilePictureURL)!
    }
}
