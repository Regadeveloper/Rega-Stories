public struct UserApiModel: Codable {
    let id: Int
    let name: String
    let profilePictureURL: String

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePictureURL = "profile_picture_url" // Mapeo explícito
    }
}
