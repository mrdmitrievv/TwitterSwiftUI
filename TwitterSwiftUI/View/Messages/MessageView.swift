//
//  MessageView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 26.10.2022.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let message: Message
    
    var body: some View {
        
        HStack(alignment: .bottom) {
                    if !message.isFromCurrentUser {
                        KFImage(URL(string: message.user.userPhotoURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    } else {
                        Spacer ()
                    }
                                                            
            Text(message.text)
                        .padding()
                        .background(message.isFromCurrentUser ? Color(.systemBlue) : Color(.systemGray5))
                        .foregroundColor(message.isFromCurrentUser ? .white : .black)
                        .clipShape(ChatBubble(isFromCurrentUser: message.isFromCurrentUser))
                }
    }
}
