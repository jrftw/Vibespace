import SwiftUI
import AVKit

struct PostView: View {
    let post: Post
    @State private var isLiked: Bool
    @State private var likeCount: Int

    init(post: Post) {
        self.post = post
        _isLiked = State(initialValue: post.isLiked ?? false)
        _likeCount = State(initialValue: post.likes)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(post.username)
                    .font(.headline)
                Spacer()
                Text(post.timestamp, style: .time)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            // Display post image if available
            if let image = post.image {
                #if canImport(UIKit)
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .clipped()
                #elseif canImport(AppKit)
                if let nsImage = NSImage(data: image) {
                    Image(nsImage: nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .clipped()
                }
                #endif
            }
            // Display video player if URL is available
            else if let videoURL = post.videoURL {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .frame(height: 300)
                    .cornerRadius(10)
            }
            // Display text content if no image or video is available
            else {
                Text(post.text)
                    .font(.body)
                    .padding(.vertical)
            }

            HStack {
                // Like button
                Button(action: {
                    isLiked.toggle()
                    likeCount += isLiked ? 1 : -1
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .gray)
                }
                Text("\(likeCount) likes")

                Spacer()

                // Comment button
                Button(action: {
                    // Comment action here
                }) {
                    Image(systemName: "message")
                }
                Text("\(post.comments) comments")
            }
            .padding(.top, 10)
        }
        .padding()
        #if canImport(UIKit)
        .background(Color(UIColor.systemBackground))
        #elseif canImport(AppKit)
        .background(Color(NSColor.windowBackgroundColor))
        #endif
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
