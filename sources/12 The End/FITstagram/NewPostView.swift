//
//  NewPostView.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 15.12.2021.
//

import SwiftUI

struct NewPost: Encodable {
    let text: String
    let photos: [String]
}

extension UIImage {
    func imageSizeInPixel() -> CGSize {
        let heightInPoints = size.height
        let heightInPixels = heightInPoints * scale

        let widthInPoints = size.width
        let widthInPixels = widthInPoints * scale

        return CGSize(width: widthInPixels, height: heightInPixels)
    }
        
    func resized(to size: CGSize) -> UIImage {
//        let format = UIGraphicsImageRendererFormat()
//        format.scale = 1

        return UIGraphicsImageRenderer(size: size, format: format).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

final class NewPostViewModel: ObservableObject {
    @Published var photo: UIImage?
    @Published var description = ""
    @Published var isPhotoPickerShown = false
    
    func createPost() {
        guard let photo = preparePhoto(photo) else { return }
        
        let newPost = NewPost(text: description, photos: [photo])
        
        var request = URLRequest(url: URL(string: "https://fitstagram.ackee.cz/api/feed")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(newPost)
        request.addValue("hromalu1", forHTTPHeaderField: "Authorization")
        
        URLSession.shared
            .dataTask(with: request) { data, response, error in
                //print("[DATA]", data)
                //print("[RESPONSE]", response)
                //print("[ERROR]", error)
                if let data = data {
                    print("[DATA]", String(data: data, encoding: .utf8))
                }
            }
            .resume()
    }
    
    private func preparePhoto(_ photo: UIImage?) -> String? {
        guard let photo = photo else { return nil }
        
        var image = photo
        if max(photo.imageSizeInPixel().width, photo.imageSizeInPixel().height) > 2048 {
            let newWidth: CGFloat
            let newHeight: CGFloat
            
            if photo.size.height > photo.size.width {
                newHeight = 2048 / photo.scale
                newWidth = photo.size.width / photo.size.height * newHeight
            } else {
                newWidth = 2048 / photo.scale
                newHeight = photo.size.height / photo.size.width * newWidth
            }
            
            let size = CGSize(width: newWidth, height: newHeight)
            image = photo.resized(to: size)
        }

        return image.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
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
                        viewModel.createPost()
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
