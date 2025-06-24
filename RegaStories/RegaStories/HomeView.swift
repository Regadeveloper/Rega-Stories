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
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { index in
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(3)
                            .background(
                                Circle().fill(
                                    .white
                                )
                            )
                            .padding(3)
                            .background(
                                Circle().fill(
                                    LinearGradient(
                                        colors: [.yellow, .red, .purple],
                                        startPoint: .bottomLeading,
                                        endPoint: .topTrailing
                                    )
                                )
                            )
                            .padding(.horizontal, 4)
                    }
                    .background(Color.white.opacity(0.8))
                }
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

#Preview {
    ContentView()
}
