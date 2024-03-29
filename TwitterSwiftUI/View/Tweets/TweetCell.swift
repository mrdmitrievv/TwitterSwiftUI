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
    @ObservedObject var tweetActionViewModel: TweetActionsViewModel
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.tweetActionViewModel = TweetActionsViewModel(tweet: tweet)
    }
    
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
                            .foregroundColor(.black)
                        Text("@\(tweet.username) •")
                            .foregroundColor(.gray)
                        Text(tweet.timestampString)
                            .foregroundColor(.gray)
                    }
                    
                    Text(tweet.caption)
                        .foregroundColor(.black)
                }
            }
            
            TweetActionsView(viewModel: tweetActionViewModel)
            
            Divider()
        }
        .padding(.horizontal)
    }
}
