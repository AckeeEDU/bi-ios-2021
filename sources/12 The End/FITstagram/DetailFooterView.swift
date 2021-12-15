//
//  DetailFooterView.swift
//  FITstagram
//
//  Created by Jakub Olejník on 12.11.2021.
//

import SwiftUI

struct DetailFooterView: View {
    @Binding var isShowingComments: Bool
    
    let post: Post
    
    var body: some View {
        HStack {
            Text("Post \(post.description)")
            
            Spacer()
            
            Button { isShowingComments.toggle() } label: {
                Image(systemName: isShowingComments ? "message.fill" : "message")
            }
        }
        .padding([.leading, .trailing])
        
        if isShowingComments {
            CommentsView(viewModel: .init(postID: post.id))
        }
    }
}

struct DetailFooterView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFooterView(
            isShowingComments: .constant(false),
            post: .init(
                id: "1",
                author: .init(
                    username: "olejnjak",
                    firstName: nil,
                    lastName: nil,
                    avatar: nil,
                    id: "1"
                ),
                likes: 1,
                photos: [
                    URL(string: "https://placeimg.com/640/480/nature")!,
                ],
                description: "Post",
                comments: 1
            )
        )
    }
}
