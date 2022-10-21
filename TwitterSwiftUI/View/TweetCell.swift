//
//  TweetCell.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 21.10.2022.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        
        VStack {
        
            HStack(alignment: .top) {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Bruce Wayne")
                            .bold()
                        Text("@batman •")
                            .foregroundColor(.gray)
                        Text("27w")
                            .foregroundColor(.gray)
                    }
                    
                    Text("It's not who I am underneath, but what I do that defines me")
                }
            }
            .padding(.bottom, 25)
            
            HStack {
                Image(systemName: "bubble.left")
                
                Spacer()
                
                Image(systemName: "arrow.2.squarepath")
                
                Spacer()
                
                Image(systemName: "heart")
                
                Spacer()
                
                Image(systemName: "bookmark")
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 10)
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
