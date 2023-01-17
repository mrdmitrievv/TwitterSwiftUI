//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 04.11.2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    @State var isImagePickerPresented = false
    @State var choosenUIImage: UIImage?
    @State var image: Image?
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    private func convertUIImage() {
        guard let uiImage = choosenUIImage else { return }
        image = Image(uiImage: uiImage)
    }
    
    var body: some View {
        VStack {
            
            Button(action: { isImagePickerPresented.toggle() }) {
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(50)
                            .padding(.top)
                    } else {
                        Image("plus_photo")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .padding(.top)
                            .foregroundColor(.white)
                    }                                        
                }
            }.sheet(isPresented: $isImagePickerPresented, onDismiss: convertUIImage) {
                ImagePicker(image: $choosenUIImage)
            }
            
            VStack(spacing: 20) {
                
                CustomTextField(text: $fullname, placeholder: Text("Full Name"), systemImageName: "person")
                    .padding()
                    .padding(.vertical, -5)
                    .background(Color(white: 1, opacity: 0.15))
                    .cornerRadius(10)
                
                CustomTextField(text: $username, placeholder: Text("User Name"), systemImageName: "person")
                    .padding()
                    .padding(.vertical, -5)
                    .background(Color(white: 1, opacity: 0.15))
                    .cornerRadius(10)
                
                CustomTextField(text: $email, placeholder: Text("Email"), systemImageName: "envelope")
                    .padding()
                    .padding(.vertical, -5)
                    .background(Color(white: 1, opacity: 0.15))
                    .cornerRadius(10)
                
                CustomSecureTextField(text: $password, placeholder: Text("Password"))
                    .padding()
                    .padding(.vertical, -5)
                    .background(Color(white: 1, opacity: 0.15))
                    .cornerRadius(10)
            }
            .padding(.top)
            .padding(.horizontal, 25)
            
            
            Button(action: {
                guard let image = choosenUIImage else { return }
                authViewModel.registerUser(email: email, fullname: fullname, username: username, password: password, userImage: image)
            }) {
                Text("Sign up")
                    .foregroundColor(.blue)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 350, height: 50)
                    .background(Color(.white))
                    .clipShape(Capsule())
            }
            .padding()
            
            Spacer()
            
            Button(action: { mode.wrappedValue.dismiss() }) {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    
                    Text("Sign in")
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding(.bottom)
                .foregroundColor(.white)
            }
            
        }
        .background(Color(UIColor(red: 77 / 255, green: 158 / 255, blue: 236 / 255, alpha: 1)))
    }
}

