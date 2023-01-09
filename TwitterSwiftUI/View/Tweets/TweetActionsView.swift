//
//  TweetActionsView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 21.11.2022.
//

import SwiftUI

struct TweetActionsView: View {
    
    let tweet: Tweet
    @ObservedObject var viewModel: TweetActionsViewModel
    
    init(tweet: Tweet) {
        self.tweet = tweet    
        self.viewModel = TweetActionsViewModel(tweet: tweet)
    }
    
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
            
            Button(action: { viewModel.isLiked ? viewModel.unlikeTweet() : viewModel.likeTweet() }) {
                Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                    .font(.system(size: 16))
                    .foregroundColor(viewModel.isLiked ? .red : .gray)
                    .frame(width: 32, height: 32)
                    .onAppear(perform: viewModel.checkIfTweetIsLiked)
            }
                        
            Spacer()
            
            Image(systemName: "bookmark")
                .font(.system(size: 16))
                .frame(width: 32, height: 32)
        }
        .foregroundColor(.gray)
        .padding(.bottom, -5)
    }
    
}
