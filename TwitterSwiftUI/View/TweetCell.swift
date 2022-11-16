//
//  TweetCell.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 21.10.2022.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    
    let tweet: Tweet
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                KFImage(URL(string: tweet.userPhotoURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size: 14, weight: .semibold))
                        Text("@\(tweet.username) •")
                            .foregroundColor(.gray)
                        Text("27w")
                            .foregroundColor(.gray)
                    }
                    
                    Text(tweet.caption)
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
        .padding(.horizontal)
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell(tweet: Tweet(dictionary: myDictionary))
    }
}
