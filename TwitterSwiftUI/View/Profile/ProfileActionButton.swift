//
//  ProfileHeaderButton.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 27.10.2022.
//

import SwiftUI

struct ProfileActionButton: View {
    let isCurrentUser: Bool
    
    var body: some View {
        
        if isCurrentUser {
            Button(action: {}) {
                Text("Edit Profile")
                    .frame(width: 340, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
        } else {
            HStack {
                Button(action: {}) {
                    Text("Following")
                        .frame(width: 160, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
                
                Button(action: {}) {
                    Text("Message")
                        .frame(width: 160, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
                }
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
            }
        }
        
        
    }
}

struct ProfileHeaderButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButton(isCurrentUser: false)
    }
}
