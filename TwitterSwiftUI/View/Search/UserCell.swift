//
//  UserCell.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 24.10.2022.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 10) {
            KFImage(URL(string: user.userPhotoURL))
                .resizable()
                .frame(width: 56, height: 56)
                .scaledToFill()
                .clipped()
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                Text(user.fullname)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
            }
            .foregroundColor(.black)
        }
    }
}

