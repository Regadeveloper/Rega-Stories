import SwiftUI
import Factory

@main
struct RegaStoriesApp: App {
    var body: some Scene {
        WindowGroup {
            Factory.createHomeView()
        }
    }
}
