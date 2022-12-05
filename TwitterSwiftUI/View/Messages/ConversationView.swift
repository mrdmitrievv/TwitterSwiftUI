//
//  ConversationView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 25.10.2022.
//

import SwiftUI

struct ConversationView: View {
    @State var isShowingNewMessageView = false
    @State var chatViewIsShown = false
    @State var user: User?
    @ObservedObject var conversationViewModel = ConversationViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
                                                     
            if let user = user {
                NavigationLink(
                    destination: LazyView(ChatView(user: user)),
                    isActive: $chatViewIsShown,
                    label: {})
            }
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(conversationViewModel.recentMessages) { message in
                        NavigationLink(destination: LazyView(ChatView(user: message.user))) {
                            ConversationCell(message: message)
                        }
                    }
                }
                .padding(.vertical)                
            }
            
            Button(action: { isShowingNewMessageView.toggle() }) {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .background(Color(UIColor(red: 0, green: 172/255, blue: 230/255, alpha: 1)))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView) {
                NewMessageView(
                    isShown: $isShowingNewMessageView,                    
                    isChatViewShown: $chatViewIsShown,
                    user: $user
                )
            }
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
