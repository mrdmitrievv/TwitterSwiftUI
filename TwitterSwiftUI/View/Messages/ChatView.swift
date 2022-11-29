//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 25.10.2022.
//

import SwiftUI

struct ChatView: View {
        
    @State var textMessage = ""
    let user: User
    let chatViewModel: ChatViewModel
    
    init(user: User) {
        self.user = user
        self.chatViewModel = ChatViewModel(user)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) { message in
                        MessageView(message: message)
                    }
                    .padding(.horizontal)
                }
            }.padding(.vertical)
            
            Divider()
            
            MessageInputView(textMessage: $textMessage, action: sendMessage)
        }
    }
    
    private func sendMessage() {
        chatViewModel.sendMessage(textMessage)
    }
}


