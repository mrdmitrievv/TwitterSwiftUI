//
//  ProfileHeaderView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 27.10.2022.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            KFImage(URL(string: user.userPhotoURL))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 6)
            
            Text(user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 3)
                
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, -8)
            
            Text("Billionaire by day, knight by night")
                .font(.system(size: 14))
                .padding(.top, 5)
            
            HStack(spacing: 30) {
                VStack {
                    Text("1")
                        .font(.system(size: 16, weight: .semibold))
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("1")
                        .font(.system(size: 16, weight: .bold))
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 7)
            
            ProfileActionButton(isCurrentUser: user.isCurrentUser)
                .padding()
        }
        .padding()
    }
}
