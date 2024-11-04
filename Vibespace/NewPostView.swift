//
//  NewPostView.swift
//  Vibespace
//
//  Created by Kevin Doyle Jr. on 11/4/24.
//


import SwiftUI

struct NewPostView: View {
    @Binding var posts: [Post]
    @State private var text = ""
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $text)
                    .padding()
                    .frame(height: 150)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
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
                .padding(.top)
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(image: $selectedImage)
                }

                Spacer()

                Button("Post") {
                    let newPost = Post(username: "current_user", timestamp: Date(), text: text, image: selectedImage, videoURL: nil, likes: 0, comments: 0)
                    posts.insert(newPost, at: 0)
                    // Dismiss the view
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            .navigationTitle("New Post")
            .navigationBarItems(leading: Button("Cancel") {
                // Dismiss the view
            })
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(posts: .constant(Post.sampleData))
    }
}
