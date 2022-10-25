//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 25.10.2022.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("venom-10")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Venom")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    Text("Longer messages text to see what happens when I do this")
                }
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
            }
            .padding(.trailing)
            
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
