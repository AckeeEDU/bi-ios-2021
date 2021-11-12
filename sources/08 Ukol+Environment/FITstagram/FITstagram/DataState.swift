import Foundation

enum DataState<DataType> {
    case loading
    case loaded(DataType)
    case error(Error)
    
    var isLoading: Bool {
        switch self {
        case .loaded, .error: return false
        case .loading: return true
        }
    }
    
    var error: Error? {
        switch self {
        case .error(let error): return error
        case .loaded, .loading: return nil
        }
    }
}
