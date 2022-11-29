//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 25.10.2022.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    
    let message: Message
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                KFImage(URL(string: message.user.userPhotoURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(message.user.username)
                            .font(.system(size: 14, weight: .semibold))
                    }
                    Text(message.text)
                }
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
            }
            .padding(.trailing)
            
            Divider()
        }
        .padding(.leading)
    }
}
