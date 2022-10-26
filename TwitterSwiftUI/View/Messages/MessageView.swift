//
//  MessageView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 26.10.2022.
//

import SwiftUI

struct MessageView: View {
    let message: MockMessage
    
    var body: some View {
        
        HStack(alignment: .bottom) {
                    if !message.isFromCurrentUser {
                        Image(message.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    } else {
                        Spacer ()
                    }
                                                            
                    Text(message.messageText)
                        .padding()
                        .background(message.isFromCurrentUser ? Color(.systemBlue) : Color(.systemGray5))
                        .foregroundColor(message.isFromCurrentUser ? .white : .black)
                        .clipShape(ChatBubble(isFromCurrentUser: message.isFromCurrentUser))
                }
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: MOCK_MESSAGES[0])
    }
}
