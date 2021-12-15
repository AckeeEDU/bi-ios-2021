//
//  NewCommentView.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/11/21.
//

import SwiftUI

struct NewCommentView: View {
    @ObservedObject var viewModel: NewCommentViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            TextField("Nový komentář", text: $viewModel.text)
                .padding(.horizontal, 20)
                .disabled(viewModel.state.isLoading)
            
            switch viewModel.state {
            case .loaded, .error:
                Button("Přidat komentář") {
                    viewModel.submit()
                }
                .font(.footnote.bold())
                .disabled(!viewModel.canSubmit)
            case .loading:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
            if viewModel.state.error != nil {
                Text("Nepodařilo se přidat komentář")
                    .foregroundColor(.red)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: { viewModel.isPresented = false }) {
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
                viewModel: .init(postID: "1", isPresented: .constant(false))
            )
        }
    }
}
