//
//  DetailView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/6/21.
//

import SwiftUI

struct DetailView: View {
    let post: Post
    @State var isShowingComments = false
    @State var isShowingControls = true

    var body: some View {
        VStack {
            DetailHeaderView(author: post.author)
                .opacity(isShowingControls ? 1 : 0)
            
            TabView {
                ForEach(post.photos, id: \.self) {
                    RemoteImage(url: $0)
                        .aspectRatio(contentMode: .fit)
                }
            }
            .tabViewStyle(.page)
            
            DetailFooterView(isShowingComments: $isShowingComments, post: post)
                .opacity(isShowingControls ? 1 : 0)
        }.onTapGesture {
            isShowingControls.toggle()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(post: .init(
            id: "1",
            author: .init(username: "olejnjak", firstName: nil, lastName: nil, avatar: nil, id: "1"),
            likes: 0,
            photos: [URL(string: "https://placeimg.com/640/480/nature")!],
            description: "",
            comments: 0
        ))
    }
}
