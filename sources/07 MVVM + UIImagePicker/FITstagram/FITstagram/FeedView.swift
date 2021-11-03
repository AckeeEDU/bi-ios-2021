//
//  FeedView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 20.10.2021.
//

import SwiftUI

struct FeedView: View {
    @State var posts: [Post] = []

    var body: some View {
        ScrollView {
            LazyVStack {
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
        .onAppear {
            fetchPosts()
        }
    }

    private func fetchPosts() {
        let url = URL(string: "https://fitstagram.ackee.cz/api/feed")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }

            posts = try! JSONDecoder().decode([Post].self, from: data)
        }
        task.resume()
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView()
        }
    }
}
