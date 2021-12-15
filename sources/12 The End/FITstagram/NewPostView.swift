//
//  NewPostView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 15.12.2021.
//

import SwiftUI

final class NewPostViewModel: ObservableObject {
    @Published var photo: UIImage?
    @Published var description = ""
    @Published var isPhotoPickerShown = false
}

struct NewPostView: View {
    @ObservedObject var viewModel: NewPostViewModel
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Photo")
                        .font(.system(.headline))
                    
                    Button {
                        viewModel.isPhotoPickerShown = true
                    } label: {
                        Rectangle()
                            .fill(Color(.secondarySystemBackground))
                            .overlay(
                                Group {
                                    if let photo = viewModel.photo {
                                        Image(uiImage: photo)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } else {
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .frame(width: 64, height: 64)
                                    }
                                }
                            )
                            .clipped()
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .padding(.top, 8)
                    
                    Text("Description")
                        .font(.system(.headline))
                        .padding(.top, 32)
                    
                    TextField("Description", text: $viewModel.description)
                        .padding(.top, 8)
                    
                    Spacer(minLength: 32)
                    
                    Button {
                        // TODO: Implement
                    } label: {
                        Text("Create post")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                Capsule()
                            )
                    }
                }
                .padding()
                .frame(minHeight: proxy.size.height)
            }
        }
        .navigationTitle("New post")
        .sheet(isPresented: $viewModel.isPhotoPickerShown) {
            ImagePicker(isPresented: $viewModel.isPhotoPickerShown, image: $viewModel.photo)
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewPostView(viewModel: NewPostViewModel())
        }
    }
}
