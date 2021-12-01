import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var isEditing = false
    @Published var profileImage: UIImage?
    @AppStorage("username") var username = ""
    @Published var images = (0..<21).map { _ in PostImage(url: URL(string: "https://placeimg.com/640/480/nature")!) }
}

struct PostImage: Identifiable {
    let id = UUID().uuidString
    let url: URL
}
