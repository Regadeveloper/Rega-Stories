import SwiftUI

@MainActor
public struct HomeView: View {

    @State private var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack(spacing: 0) {
            storiesScrollView
            contentView
        }
        .task {
            await viewModel.loadInitialUsers()
        }
    }

    private var storiesScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.users.indices, id: \.self) { index in
                    let user = viewModel.users[index]
                    storyIcon(for: user)
                        .onAppear {
                            viewModel.loadMoreUsersIfNeeded(at: index)
                        }
                }
            }
            .padding(4)
        }
        .frame(height: 95)
    }

    private func storyIcon(for user: UserViewModel) -> some View {
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

    private var contentView: some View {
        LinearGradient(
            colors: [.yellow, .red, .purple],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea(edges: .bottom)
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
