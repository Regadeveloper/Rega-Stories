public struct User {
    let id: Int
    let name: String
    let profilePictureURL: String

    public init(id: Int, name: String, profilePictureURL: String) {
        self.id = id
        self.name = name
        self.profilePictureURL = profilePictureURL
    }
}
