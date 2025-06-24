import Foundation
import Domain

public protocol GetUsersPageDataSource {
    func getUsersPageDataSource(page: Int) async throws -> UserPage
}

enum GetUserPageDataSourceError: Error {
    case pageNotFound
    case fileNotFound(String)
    case decodingError(Error)
    case invalidData
}

public struct DefaultGetUsersPageDataSource: GetUsersPageDataSource {
    public init() {}

    private let jsonDecoder = JSONDecoder()

    public func getUsersPageDataSource(page: Int) async throws -> UserPage {
        let jsonName: String
        switch page {
        case 1:
            jsonName = "FirstUserPage"
        case 2:
            jsonName = "SecondUserPage"
        case 3:
            jsonName = "LastUserPage"
        default:
            jsonName = "FirstUserPage" // Default to the first page for infinite loading in this example
        }

        let jsonData = try loadJSON(named: jsonName)

        do {
            let userPageApi = try jsonDecoder.decode(UserPageApi.self, from: jsonData)
            return userPageApi.toDomain()
        } catch {
            throw GetUserPageDataSourceError.decodingError(error)
        }
    }

    private func loadJSON(named fileName: String) throws -> Data {
        guard let json = Bundle.module.url(forResource: fileName, withExtension: "json") else {
            throw GetUserPageDataSourceError.fileNotFound(fileName)
        }

        return try Data(contentsOf: json)
    }
}

extension UserPageApi {
    func toDomain() -> UserPage {
        UserPage(page: page, totalPages: totalPages, hasNextPage: hasNextPage, users: users.map { $0.toDomain() })
    }
}

extension UserApiModel {
    func toDomain() -> User {
        User(id: id, name: name, profilePictureURL: profilePictureURL)
    }
}
