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
                    ForEach(0..<30) { _ in
                        HStack {
                            Spacer()
                            Text("This is place for message bubbles")
                                .padding()
                                .background(Color(.systemBlue))
                                .foregroundColor(.white)
                                .clipShape(ChatBubble(isFromCurrentUser: true))
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
