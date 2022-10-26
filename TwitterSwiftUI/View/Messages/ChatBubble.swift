//
//  ChatBubble.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 26.10.2022.
//

import SwiftUI

struct ChatBubble: Shape {
        
    var isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft : .bottomRight],
            cornerRadii: CGSize(width: 16, height: 16)
        )
        
        return Path(path.cgPath)
    }
    
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCurrentUser: true)
    }
}
