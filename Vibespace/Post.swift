import Foundation
import UIKit

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let timestamp: Date
    let text: String
    let image: UIImage?
    let videoURL: URL?
    let likes: Int
    let comments: Int

    static let sampleData = [
        Post(username: "johndoe", timestamp: Date(), text: "Loving the vibes here!", image: UIImage(named: "sampleImage"), videoURL: nil, likes: 32, comments: 5),
        Post(username: "janedoe", timestamp: Date(), text: "", image: nil, videoURL: URL(string: "https://sample-videos.com/video123/mp4/480/asdasdas.mp4"), likes: 40, comments: 12),
        Post(username: "cooluser", timestamp: Date(), text: "Just had a great day!", image: nil, videoURL: nil, likes: 25, comments: 3)
    ]
}
