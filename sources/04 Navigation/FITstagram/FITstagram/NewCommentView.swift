//
//  NewCommentView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/11/21.
//

import SwiftUI

struct NewCommentView: View {
    
    @State private var comment = ""
    
    let onNewComment: (String) -> Void
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            TextField("Nový komentář", text: $comment)
                .padding(.horizontal, 20)
            
            Button("Přidat komentář") {
                onNewComment(comment)
                isPresented = false
            }
            .font(.footnote.bold())
            .disabled(comment.isEmpty)
        }
    }
}

struct NewCommentView_Previews: PreviewProvider {
    static var previews: some View {
        NewCommentView(
            onNewComment: { _ in },
            isPresented: .constant(false)
        )
    }
}
