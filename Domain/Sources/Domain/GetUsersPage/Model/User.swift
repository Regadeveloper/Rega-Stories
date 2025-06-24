public struct User {
    public let id: Int
    public let name: String
    public let profilePictureURL: String

    public init(id: Int, name: String, profilePictureURL: String) {
        self.id = id
        self.name = name
        self.profilePictureURL = profilePictureURL
    }
}
