//
//  ProfileView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 20.10.2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    Circle()
                        .frame(width: 48, height: 48)

                    Text("Username")
                }
                .padding()

                LazyVGrid(columns: [GridItem(spacing: 1), GridItem(spacing: 1), GridItem(spacing: 1)], spacing: 1) {
                    ForEach(0..<21) { _ in
                        Rectangle()
                            .fill(Color.white)
                            .aspectRatio(1, contentMode: .fill)
                            .overlay(
                                RemoteImage(urlString: "https://placeimg.com/640/480/nature")
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
            ProfileView()
        }
    }
}
