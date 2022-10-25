//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 25.10.2022.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var textMessage: String
    
    var body: some View {
        HStack {
            TextField("Message...", text: $textMessage)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: {}) {
                Text("Send")
            }
        }
        .padding()
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(textMessage: .constant(""))
    }
}
