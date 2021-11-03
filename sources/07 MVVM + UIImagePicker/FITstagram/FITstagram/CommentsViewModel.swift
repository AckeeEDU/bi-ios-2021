import Foundation
import SwiftUI

class CommentsViewModel: ObservableObject {
    enum DataState {
        case loading
        case comments([Comment])
        case error(Error)
    }
    
    @Published private(set) var state = DataState.comments([])
    @Published var isNewCommentShown = false
    
    private let postID: Post.ID
    
    // MARK: - Initializers
    
    init(postID: Post.ID) {
        self.postID = postID
    }
    
    // MARK: - Interface
    
    func fetchComments() {
        let url = URL(string: "https://fitstagram.ackee.cz/api/feed/" + postID + "/comments")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.state = .error(error)
                    return
                }
                
                guard let data = data else {
                    self?.state = .comments([])
                    return
                }
                
                do {
                    self?.state = .comments(try JSONDecoder().decode([Comment].self, from: data))
                } catch {
                    self?.state = .error(error)
                    print(error)
                }
            }
        }
        
        state = .loading
        task.resume()
    }
}
