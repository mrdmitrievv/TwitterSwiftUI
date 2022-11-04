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
                
                CustomTextField(text: $password, placeholder: Text("Password"), systemImageName: "lock")
                     .padding()
                     .padding(.vertical, -5)
                     .background(Color(white: 1, opacity: 0.15))
                     .cornerRadius(10)
            }
            .padding(.top, -20)
            .padding(.horizontal, 25)
            
            Spacer()
        }
        .background(Color(UIColor(red: 77 / 255, green: 158 / 255, blue: 236 / 255, alpha: 1)))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
