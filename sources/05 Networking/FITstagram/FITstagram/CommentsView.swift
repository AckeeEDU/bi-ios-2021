//
//  CommentsView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/11/21.
//

import SwiftUI

let comments = [
    Comment(username: "lukas.hromadnik", text: "Pěkný"),
    Comment(username: "jakub.olejnik", text: "Proč bych chodil do přírody..."),
    Comment(username: "emoji.guru", text: "🏔🌅💦")
]

struct CommentsView: View {
    @State var comments: [Comment]
    @State private var isNewCommentShown = false
    
    var body: some View {
        List(comments, id: \.id) { comment in
            Group {
                Text(comment.username)
                    .fontWeight(.semibold)
                + Text(" " + comment.text)
            }
        }
        .listStyle(.grouped)
        .fullScreenCover(isPresented: $isNewCommentShown) {
            NewCommentView(
                onNewComment: { comments.append(Comment(username: "igor.rosocha", text: $0)) },
                isPresented: $isNewCommentShown)
        }
        .navigationBarTitle("Komentáře")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isNewCommentShown = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView(comments: comments)
        }
    }
}
