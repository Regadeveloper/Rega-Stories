protocol GetUserPageDataSource {
    func getUserPageDataSource(page: Int) async throws -> PagesApiModel)
}

enum GetUserPageDataSourceError: Error {
    case pageNotFound
    case fileNotFound(String)
    case decodingError(Error)
    case invalidData
}

struct DefaultGetUserPageDataSource: GetUserPageDataSource {
    func getUserPageDataSource(page: Int) async throws -> UserPageResponse {
        var jsonName: String = {
            switch page {
            case 1:
                return "FirstUserPage"
            case 2:
                return "SecondUserPage"
            case 3:
                return "ThirdUserPage"
            default:
                return "FirstUserPage" // Default to the first page for infinite loading in this example
            }
        }()

        guard let jsonData = jsonString.data(using: .utf8) else {
            throw DataSourceError.invalidData
        }

        do {
            let userPage = try jsonDecoder.decode(UserPageResponse.self, from: jsonData)
            return userPage
        } catch {
            throw DataSourceError.decodingError(error)
        }
    }
}
