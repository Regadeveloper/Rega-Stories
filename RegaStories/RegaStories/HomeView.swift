//
//  HomeView.swift
//  RegaStories
//
//  Created by Raul Regadera on 24/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<10) { index in
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .background(Color.white)
                            .clipShape(Circle())
                            .modifier(StoryOverlay())
                            .frame(width: 80, height: 80)
                            .padding(.horizontal, 3)

                    }
                    .background(Color.white.opacity(0.8))
                }
                .padding(4)
            }
            LinearGradient(
                colors: [.yellow, .red, .purple],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(edges: .bottom)
        }
    }
}


struct StoryOverlay: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(4)
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [.yellow, .red, .purple],
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        ),
                        lineWidth: 4
                    )
            )    }
}

#Preview {
    ContentView()
}
