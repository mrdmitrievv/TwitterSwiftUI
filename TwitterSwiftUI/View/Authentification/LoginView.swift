//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 04.11.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("twitter-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 240, height: 240)
                    .padding(.top, -10)
                        
                VStack(spacing: 20) {
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
                .padding(.top, -20)
                .padding(.horizontal, 25)
                
                HStack {
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.trailing, 28)
                .padding(.top)
                
                Button(action: {}) {
                    Text("Sign in")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: 350, height: 50)
                        .background(Color(.white))
                        .clipShape(Capsule())
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)) {
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign up")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .padding(.bottom)
                    .foregroundColor(.white)
                }
                
            }
            .background(Color(UIColor(red: 77 / 255, green: 158 / 255, blue: 236 / 255, alpha: 1)))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
