//
//  ContentView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Label("Feed", systemImage: "list.dash")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profil", systemImage: "person")
                    }
            }
        }
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
