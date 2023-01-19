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
    @Published var tweetLikes = 0
    private let globalQueue = DispatchQueue.global()
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkTweetLikes()
        checkIfTweetIsLiked()
    }
    
    func likeTweet() {
        
        globalQueue.async {
            guard let uid = AuthViewModel.shared.userSession?.uid else { return }
            let tweetsLikesRef = COLLECTION_TWEETS.document(self.tweet.id).collection("tweet-likes")
            let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
            
            COLLECTION_TWEETS.document(self.tweet.id).updateData(["likes": self.tweet.likes + 1]) { _ in
                tweetsLikesRef.document(uid).setData([:]) { _ in
                    userLikesRef.document(self.tweet.id).setData([:]) { _ in
                        self.isLiked = true
                        self.checkTweetLikes()
                    }
                }
            }
        }
    }
    
    func unlikeTweet() {
        
        globalQueue.async {
            guard let uid = AuthViewModel.shared.userSession?.uid else { return }
            let tweetsLikesRef = COLLECTION_TWEETS.document(self.tweet.id).collection("tweet-likes")
            let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
            
            COLLECTION_TWEETS.document(self.tweet.id).updateData(["likes": self.tweet.likes - 1]) { _ in
                tweetsLikesRef.document(uid).delete { _ in
                    userLikesRef.document(self.tweet.id).delete { _ in
                        self.isLiked = false
                        self.checkTweetLikes()
                    }
                }
            }
        }
    }
    
    func checkIfTweetIsLiked() {
        
        globalQueue.async {
            guard let uid = AuthViewModel.shared.userSession?.uid else { return }
            let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
            
            userLikesRef.document(self.tweet.id).getDocument { snapshot, _ in
                guard let isLiked = snapshot?.exists else { return }
                self.isLiked = isLiked
            }
        }
    }
    
    func checkTweetLikes() {
        globalQueue.async {
            COLLECTION_TWEETS.document(self.tweet.id).collection("tweet-likes").getDocuments { snapshot, _ in
                guard let likes = snapshot?.count else { return }
                self.tweetLikes = likes
            }
        }
    }
}
