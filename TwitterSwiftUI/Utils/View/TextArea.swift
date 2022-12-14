//
//  TextArea.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 28.10.2022.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self._text = text
        self.placeholder = placeholder
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            if text.isEmpty {
                
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .padding(4)
                .opacity(text.isEmpty ? 0.25 : 1)
        }
        .font(.body)
    }
}
