//
//  ContentView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/5/21.
//

import SwiftUI

struct ContentView: View {
    let postsRepository = PostsRepository()
    
    var body: some View {
        TabView {
            NavigationView {
                FeedView(viewModel: FeedViewModel(postsRepository: postsRepository))
            }.tabItem {
                Label("Feed", systemImage: "list.dash")
            }
            
            NavigationView {
                ProfileView(viewModel: .init())
            }.tabItem {
                Label("Profil", systemImage: "person")
            }
        }
        .environmentObject(postsRepository)
    }
    
    private func buttonImage(_ systemName: String) -> some View {
        Image(systemName: systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 24)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)

        ContentView()
            .preferredColorScheme(.dark)
    }
}
