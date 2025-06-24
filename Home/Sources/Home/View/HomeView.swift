import SwiftUI

@MainActor
public struct HomeView: View {

    @State private var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.users) { user in
                        AsyncImage(
                            url: user.pictureURL,
                            content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            },
                            placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.gray)
                                    .padding(20)
                            }
                        )
                        .background(Color.white)
                        .clipShape(Circle())
                        .modifier(StoryOverlay())
                        .frame(width: 80, height: 80)
                        .padding(.horizontal, 3)
                    }
                }
                .padding(4)
            }
            .frame(height: 95)

            LinearGradient(
                colors: [.yellow, .red, .purple],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(edges: .bottom)
        }
        .task {
            do {
                try await viewModel.fetchUsers(page: 1)
            } catch {
                print("🔴 Error al obtener los usuarios: \(error)")
            }
        }
    }
}

private struct StoryOverlay: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(3)
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [.yellow, .red, .purple],
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        ),
                        lineWidth: 3
                    )
            )
    }
}
