import SwiftUI

class NewCommentViewModel: ObservableObject {
    struct InvalidResponse: Error {
        let response: URLResponse?
        var httpResponse: HTTPURLResponse? { response as? HTTPURLResponse }
    }
    
    @Published private(set) var canSubmit = false
    @Published var text = "" {
        didSet { updateCanSubmit() }
    }
    @Published private(set) var state = DataState<Comment?>.loaded(nil)
    
    @Binding var isPresented: Bool
    private let postID: Post.ID
    
    // MARK: - Initializers
    
    init(postID: Post.ID, isPresented: Binding<Bool>) {
        self.postID = postID
        _isPresented = isPresented
    }
    
    // MARK: - Interface
    
    func submit() {
        guard canSubmit else { return }
        
        let url = URL(string: "https://fitstagram.ackee.cz/api/feed/" + postID + "/comments")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(UserDefaults.standard.string(forKey: "username"), forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(["text": text])

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    self?.state = .error(error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                    print("Invalid HTTP response")
                    self?.state = .error(InvalidResponse(response: response))
                    return
                }
                
                guard let data = data else {
                    self?.state = .loaded(nil)
                    return
                }
                
                do {
                    self?.state = .loaded(try JSONDecoder().decode(Comment.self, from: data))
                    self?.isPresented = false
                } catch {
                    print(error)
                    self?.state = .error(error)
                }
            }
        }
        
        state = .loading
        task.resume()

    }
    
    // MARK: - Private helpers
    
    private func updateCanSubmit() {
        canSubmit = text.count > 0
    }
}
