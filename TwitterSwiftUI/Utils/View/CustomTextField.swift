//
//  CustomTextField.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 04.11.2022.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    let placeholder: Text
    let systemImageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .padding(.leading, 25)
                    .foregroundColor(Color(white: 1, opacity: 0.60))
            }
            
            HStack {
                Image(systemName: systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15, alignment: .center)
                
                TextField("", text: $text)
            }
            .foregroundColor(.white)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: Text("Email"), systemImageName: "envelope")
    }
}
