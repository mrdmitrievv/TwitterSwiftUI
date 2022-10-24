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
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Wayne")
                            .font(.system(size: 14, weight: .semibold))
                        Text("@batman •")
                            .foregroundColor(.gray)
                        Text("27w")
                            .foregroundColor(.gray)
                    }
                    
                    Text("It's not who I am underneath, but what I do that defines me")
                }
            }
            
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
            
            Divider()
        }
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
