import SwiftUI
#if canImport(UIKit)
import UIKit
import PhotosUI
#endif

struct NewPostView: View {
    @Binding var posts: [Post]
    @State private var text = ""
    @State private var selectedImageData: Data?
    @State private var showImagePicker = false
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .topLeading) {
                    if text.isEmpty {
                        Text("Write your post here...")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $text)
                        .padding()
                        #if canImport(UIKit)
                        .background(Color(UIColor.secondarySystemBackground))
                        #elseif canImport(AppKit)
                        .background(Color(NSColor.windowBackgroundColor)) // Fallback for macOS
                        #endif
                        .cornerRadius(10)
                }

                #if canImport(UIKit)
                Button(action: {
                    showImagePicker = true
                }) {
                    HStack {
                        Image(systemName: "photo.on.rectangle.angled")
                        Text("Add Image")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .sheet(isPresented: $showImagePicker) {
                    VibespaceImagePicker(image: Binding(get: {
                        if let imageData = selectedImageData {
                            return UIImage(data: imageData)
                        }
                        return nil
                    }, set: {
                        selectedImageData = $0?.jpegData(compressionQuality: 1.0)
                    }))
                }
                #endif

                Spacer()

                Button("Post") {
                    #if canImport(UIKit)
                    var selectedImage: UIImage? = nil
                    if let imageData = selectedImageData {
                        selectedImage = UIImage(data: imageData)
                    }
                    #endif

                    let newPost = Post(username: "current_user", timestamp: Date(), text: text, image: selectedImage, videoURL: nil, likes: 0, comments: 0)
                    posts.insert(newPost, at: 0)
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            .navigationTitle("New Post")
            #if os(iOS)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
            #elseif os(macOS)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            #endif
        }
    }
}
