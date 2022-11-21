//
//  TweetDetailsView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 21.11.2022.
//

import SwiftUI
import Kingfisher

struct TweetDetailsView: View {
    let tweet: Tweet
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 10) {
                KFImage(URL(string: tweet.userPhotoURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(tweet.fullname)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text("@\(tweet.username)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
            }
            .padding(.horizontal)
            
            Text(tweet.caption)
                .font(.system(size: 16))
                .padding(.horizontal)
            
            Text("7:22 PM • 21/11/2022")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Divider()
            
            HStack {
                HStack(spacing: 4) {
                    Text("0")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Retweets")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 4) {
                    Text("\(tweet.likes)")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }.padding(.horizontal)
            
            Divider()
            
            TweetActionsView(tweet: tweet)
                .padding(.horizontal, 30)
            
            Spacer()
        }
        
    }
}

