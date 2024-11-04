import SwiftUI

struct FeedView: View {
    @State private var posts: [Post] = Post.sampleData  // Replace with actual data source
    @State private var isShowingNewPostScreen = false

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(posts) { post in
                        PostView(post: post)
                    }
                }
                .padding(.horizontal)
            }
            #if os(iOS)
            .navigationTitle("VibeSpace")
            .navigationBarItems(trailing: Button(action: {
                isShowingNewPostScreen.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
            })
            #elseif os(macOS)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        isShowingNewPostScreen.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
            }
            #endif
            .sheet(isPresented: $isShowingNewPostScreen) {
                NewPostView(posts: $posts)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
