//
//  ContentView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/5/21.
//

import SwiftUI

struct ContentView: View {
    var posts = [
        Post(id: "1", username: "uzivatel.1", likes: 1, description: "První popisek!", comments: 10),
        Post(id: "2", username: "uzivatel.2", likes: 128, description: "Druhý popisek!", comments: 20),
        Post(id: "3", username: "uzivatel.3", likes: 256,  description: "Třetí popisek!", comments: 30),
        Post(id: "4", username: "uzivatel.4", likes: 1024, description: "Čtvrtý popisek!", comments: 40),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem()]) {
                    ForEach(posts, id: \.id) { post in
                        VStack(alignment: .leading, spacing: 8) {
                            PostView(post: post)
                        }
                    }
                }
            }
            .navigationTitle("FITstagram")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: { }) {
                        Image(systemName: "magnifyingglass")
                    }
                    
                    Button(action: { }) {
                        Image(systemName: "plus")
                    }
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
