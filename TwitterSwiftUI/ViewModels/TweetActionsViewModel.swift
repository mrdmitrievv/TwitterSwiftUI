//
//  TweetActionsViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 21.11.2022.
//

import SwiftUI
import Firebase

class TweetActionsViewModel: ObservableObject {
    
    let tweet: Tweet
    @Published var isLiked = false
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let tweetsLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes + 1]) { _ in
            tweetsLikesRef.document(uid).setData([:]) { _ in
                userLikesRef.document(self.tweet.id).setData([:]) { _ in
                    self.isLiked = true
                }
            }
        }
        
        
    }
    
    func unlikeTweet() {}
    
    
}
