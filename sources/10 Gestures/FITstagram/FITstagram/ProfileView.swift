//
//  ProfileView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 20.10.2021.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    Image(uiImage: viewModel.profileImage ?? UIImage())
                        .resizable()
                        .background(Color.gray)
                        .frame(width: 48, height: 48)
                        // Next shadow view modifier is not required and does nothing in UI,
                        // but for some reason SwiftUI ocassionally renders this view as square
                        // instead of circle that is used as its `clipShape(...)`,
                        // on real device it looks fine always, this seems to be an issue in SwiftUI
                        .shadow(radius: 0)
                        .clipShape(Circle())

                    Text(viewModel.username.isEmpty ? "(anonym)" : viewModel.username)
                        .opacity(viewModel.username.isEmpty ? 0.5 : 1)
                    
                    Spacer()
                    NavigationLink(destination: EditProfileView(image: $viewModel.profileImage)) {
                        Image(systemName: "pencil")
                            .padding(4)
                    }
                }
                .padding()

                LazyVGrid(columns: [GridItem(spacing: 1), GridItem(spacing: 1), GridItem(spacing: 1)], spacing: 1) {
                    ForEach(viewModel.images) { postImage in
                        Rectangle()
                            .fill(Color.white)
                            .aspectRatio(1, contentMode: .fill)
                            .overlay(
                                RemoteImage(url: postImage.url)
                                    .aspectRatio(contentMode: .fill)
                            )
                            .clipped()
                    }
                }
            }
        }
        .navigationTitle("Profil")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(viewModel: .init())
        }
    }
}
