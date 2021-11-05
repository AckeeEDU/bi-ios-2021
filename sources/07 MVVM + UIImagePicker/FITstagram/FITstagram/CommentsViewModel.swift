import Foundation
import SwiftUI

class CommentsViewModel: ObservableObject {
    @Published private(set) var state = DataState<[Comment]>.loaded([])
    @Published var isNewCommentShown = false
    
    let postID: Post.ID
    
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if let error = error {
                    self?.state = .error(error)
                    return
                }
                
                guard let data = data else {
                    self?.state = .loaded([])
                    return
                }
                
                do {
                    self?.state = .loaded(try JSONDecoder().decode([Comment].self, from: data))
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
