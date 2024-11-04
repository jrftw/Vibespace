//
//  SignUpView.swift
//  Vibespace
//
//  Created by Kevin Doyle Jr. on 11/4/24.
//


import SwiftUI
import PhotosUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var middleName = ""
    @State private var lastName = ""
    @State private var birthday = Date()
    @State private var location = ""
    @State private var username = ""
    @State private var avatarImage: UIImage?
    @State private var bannerImage: UIImage?
    @State private var showAvatarPicker = false
    @State private var showBannerPicker = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Social Login Buttons
                    VStack {
                        Button(action: {
                            // Implement Sign in with Apple logic
                        }) {
                            HStack {
                                Image(systemName: "applelogo")
                                Text("Continue with Apple")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        
                        Button(action: {
                            // Implement Google Sign In logic
                        }) {
                            HStack {
                                Image(systemName: "globe")
                                Text("Continue with Google")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        
                        Button(action: {
                            // Implement Facebook Sign In logic
                        }) {
                            HStack {
                                Image(systemName: "facebook")
                                Text("Continue with Facebook")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.bottom, 30)

                    // User Information Form
                    VStack(alignment: .leading) {
                        Text("First Name")
                        TextField("First Name", text: $firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Middle Name (Optional)")
                        TextField("Middle Name", text: $middleName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Last Name")
                        TextField("Last Name", text: $lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Birthday")
                        DatePicker("Select your birthday", selection: $birthday, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                        
                        Text("Where are you from?")
                        TextField("Location", text: $location)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Username")
                        TextField("Username", tex
