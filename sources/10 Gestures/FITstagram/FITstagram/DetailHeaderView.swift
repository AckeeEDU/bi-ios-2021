//
//  DetailHeaderView.swift
//  FITstagram
//
//  Created by Jakub Olejník on 12.11.2021.
//


import SwiftUI

struct DetailHeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.isEnabled) var isEnabled
    
    let author: Author
    
    var body: some View {
        HStack {
            Group {
                if let avatar = author.avatar {
                    RemoteImage(url: avatar)
                        .aspectRatio(contentMode: .fill)
                } else {
                    Image(systemName: "person.circle")
                        .resizable()
                }
            }
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            
            Text(author.username)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding()
                    Text(isEnabled ? "enabled" : "X")
                }
            }
        }.padding([.leading, .trailing])
    }
}

struct DetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeaderView(author: .dummy)
    }
}
