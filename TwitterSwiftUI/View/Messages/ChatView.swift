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
    @ObservedObject var chatViewModel: ChatViewModel
    
    init(user: User) {
        self.user = user
        self.chatViewModel = ChatViewModel(user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(chatViewModel.messages) { message in
                        MessageView(message: message)
                    }
                    .padding(.horizontal)
                }
            }.padding(.vertical)
            
            Divider()
            
            MessageInputView(textMessage: $textMessage, action: sendMessage)
        }.navigationTitle(user.username)
    }
    
    private func sendMessage() {
        chatViewModel.sendMessage(textMessage)
    }
}


