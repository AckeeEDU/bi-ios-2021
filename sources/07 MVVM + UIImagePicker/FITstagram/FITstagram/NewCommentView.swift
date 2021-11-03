//
//  NewCommentView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/11/21.
//

import SwiftUI

struct NewCommentView: View {
    
    @State private var comment = ""
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            TextField("Nový komentář", text: $comment)
                .padding(.horizontal, 20)
            
            Button("Přidat komentář") {
//                onNewComment(comment)
                isPresented = false
            }
            .font(.footnote.bold())
            .disabled(comment.isEmpty)
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: { isPresented = false }) {
                    Image(systemName: "xmark")
                }
            }
        }
    }
}

struct NewCommentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewCommentView(
                //            onNewComment: { _ in },
                isPresented: .constant(false)
            )
        }
    }
}
