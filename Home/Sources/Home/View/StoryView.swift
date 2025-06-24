import SwiftUI

struct StoryView: View {
    let imageURL: URL?

    public init(imageURL: URL? = nil) {
        self.imageURL = imageURL
    }

    var body: some View {
        VStack {
            AsyncImage(
                url: imageURL,
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
            .frame(width: 80, height: 80)
            .padding(.horizontal, 3)
        }
        Image(systemName: "heart.fill")
            .foregroundColor(.red)
            .padding(5)
            .background(Color.white.opacity(0.8))
            .clipShape(Circle())
            .offset(x: 30, y: -30)
    }
}
