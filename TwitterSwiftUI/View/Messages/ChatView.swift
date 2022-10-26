//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 25.10.2022.
//

import SwiftUI

struct ChatView: View {
    
    @State var textMessage = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) { message in
                        
                        if message.isFromCurrentUser {
                            HStack {
                                Spacer()
                                Text(message.messageText)
                                    .padding()
                                    .background(Color(.systemBlue))
                                    .foregroundColor(.white)
                                    .clipShape(ChatBubble(isFromCurrentUser: true))
                            }
                        } else {
                            HStack {
                                Image(message.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                Text(message.messageText)
                                    .padding()
                                    .background(Color(.systemGray5))
                                    .foregroundColor(.black)
                                    .clipShape(ChatBubble(isFromCurrentUser: true))
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                }
            }.padding(.vertical)
            
            Divider()
            
            MessageInputView(textMessage: $textMessage)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
