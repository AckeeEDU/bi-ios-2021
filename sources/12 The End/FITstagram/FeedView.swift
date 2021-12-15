//
//  FeedView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 20.10.2021.
//

import SwiftUI

enum Sheet: Identifiable {
    case detail(Post)
    case story

    var id: Int {
        switch self {
        case .detail: return 0
        case .story: return 1
        }
    }
}

final class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var selectedSheet: Sheet?
    @Published var showNewPost = false
    
    func fetchPosts() {
        let url = URL(string: "https://fitstagram.ackee.cz/api/feed")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self?.posts = try! JSONDecoder().decode([Post].self, from: data)
            }
        }
        task.resume()
    }
}

struct FeedView: View {
    @ObservedObject var viewModel: FeedViewModel

    var body: some View {
        ZStack {
            NavigationLink.init(isActive: $viewModel.showNewPost, destination: { NewPostView() }) {
                EmptyView()
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.posts, id: \.id) { post in
                        VStack(alignment: .leading, spacing: 8) {
                            PostView(post: post)
                                .onTapGesture {
                                    viewModel.selectedSheet = .detail(post)
                                }
                        }
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

                Button(action: { viewModel.showNewPost = true }) {
                    Image(systemName: "plus")
                }

                Button {
                    viewModel.selectedSheet = .story
                } label: {
                    Image(systemName: "plus.rectangle.portrait")
                }
            }
        }
        .onAppear {
            viewModel.fetchPosts()
        }
        .fullScreenCover(item: $viewModel.selectedSheet, onDismiss: nil) { sheet in
            switch sheet {
            case let .detail(post):
                DetailView(post: post)

            case .story:
                NavigationView {
                    StoryView()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView(viewModel: FeedViewModel())
        }
    }
}
