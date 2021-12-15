//
//  EditProfileView.swift
//  FITstagram
//
//  Created by Jakub Olejník on 02.11.2021.
//

import SwiftUI

struct EditProfileView: View {
    @Binding private(set) var image: UIImage?
    @AppStorage("username") var username = ""
    @State private var isImagePickerPresented = false
    
    var body: some View {
        VStack {
            Button(action: { isImagePickerPresented = true }) {
                ZStack {
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                    } else {
                        Color.gray
                    }
                    
                    Image(systemName: "pencil")
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }
            }
            .aspectRatio(1, contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text("Username")
                TextField("Enter username", text: $username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }.padding()
        }.sheet(isPresented: $isImagePickerPresented, onDismiss: nil) {
            ImagePicker(isPresented: $isImagePickerPresented, image: _image)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    @State static var image: UIImage?
    
    static var previews: some View {
        EditProfileView(image: $image)
    }
}
