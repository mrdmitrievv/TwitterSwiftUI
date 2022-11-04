//
//  CustomSecureTextField.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 04.11.2022.
//

import SwiftUI

struct CustomSecureTextField: View {
    
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .padding(.leading, 25)
                    .foregroundColor(Color(white: 1, opacity: 0.60))
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15, alignment: .center)
                
                TextField("", text: $text)
            }
            .foregroundColor(.white)
        }
    }
}
