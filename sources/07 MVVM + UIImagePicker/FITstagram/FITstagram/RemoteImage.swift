//
//  RemoteImage.swift
//  FITstagram
//
//  Created by Lukáš Hromadník on 20.10.2021.
//

import SwiftUI

struct RemoteImage: View {
    @State private var image: Image?
    let url: URL

    var body: some View {
        if let image = image {
            image
                .resizable()
        } else {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .onAppear { fetchImage() }
        }
    }

    private func fetchImage() {
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: url)
            let uiImage = UIImage(data: data)!

            DispatchQueue.main.async {
                image = Image(uiImage: uiImage)
            }
        }
    }
}

extension RemoteImage {
    init(urlString: String) {
        self.url = URL(string: urlString)!
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(urlString: "https://placeimg.com/320/320/nature")
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
