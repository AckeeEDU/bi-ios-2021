//
//  NewPostView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 15.12.2021.
//

import SwiftUI

struct NewPostView: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Photo")
                        .font(.system(.headline))
                    
                    Rectangle()
                        .fill(.red)
                        .aspectRatio(1, contentMode: .fit)
                        .padding(.top, 8)
                    
                    Text("Description")
                        .font(.system(.headline))
                        .padding(.top, 32)
                    
                    TextField("Description", text: .constant(""))
                        .padding(.top, 8)
                    
                    Spacer()
                    
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
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewPostView()
        }
    }
}
