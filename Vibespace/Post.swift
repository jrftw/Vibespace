import Foundation
#if canImport(UIKit)
import UIKit
#endif

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let timestamp: Date
    let text: String
    #if canImport(UIKit)
    let image: UIImage?
    #else
    let image: Data? // Fallback for non-UIKit platforms
    #endif
    let videoURL: URL?
    let likes: Int
    let comments: Int
    var isLiked: Bool?

    static let sampleData = [
        Post(username: "johndoe", timestamp: Date(), text: "Loving the vibes here!", image: nil, videoURL: nil, likes: 32, comments: 5, isLiked: false),
        Post(username: "janedoe", timestamp: Date(), text: "What a great day!", image: nil, videoURL: nil, likes: 40, comments: 12, isLiked: false),
        Post(username: "cooluser", timestamp: Date(), text: "Just hanging out...", image: nil, videoURL: nil, likes: 25, comments: 3, isLiked: false)
    ]
}
