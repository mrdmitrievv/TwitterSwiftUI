//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 25.10.2022.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var textMessage: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            TextField("Message...", text: $textMessage)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: { action() }) {
                Text("Send")
            }
        }
        .padding()
    }
}

