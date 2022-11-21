//
//  TweetActionsView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 21.11.2022.
//

import SwiftUI

struct TweetActionsView: View {
    var body: some View {
        
        HStack {
            Image(systemName: "bubble.left")
                .font(.system(size: 16))
                .frame(width: 32, height: 32)
            
            Spacer()
            
            Image(systemName: "arrow.2.squarepath")
                .font(.system(size: 16))
                .frame(width: 32, height: 32)
            
            Spacer()
            
            Image(systemName: "heart")
                .font(.system(size: 16))
                .frame(width: 32, height: 32)
            
            Spacer()
            
            Image(systemName: "bookmark")
                .font(.system(size: 16))
                .frame(width: 32, height: 32)
        }
        .foregroundColor(.gray)
        .padding(.bottom, -5)
    }
    
}

struct TweetActionsView_Previews: PreviewProvider {
    static var previews: some View {
        TweetActionsView()
    }
}
