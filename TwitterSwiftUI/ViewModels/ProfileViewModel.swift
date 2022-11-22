//
//  ProfileViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 11.11.2022.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    @Published var isFollowed = false
    @Published var userTweets = [Tweet]()
    @Published var userLikedTweets = [Tweet]()
    let user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserTweets()
        fetchLikedTweets()
    }
    
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
        
        
        followingRef.document(user.id).setData([:]) { _ in
            followersRef.document(currentUid).setData([:]) { _ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
        
        followingRef.document(user.id).delete { _ in
            followersRef.document(currentUid).delete { _ in
                self.isFollowed = false
            }
        }
    }
    
    private func checkIfUserIsFollowed() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        
        followingRef.document(user.id).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.isFollowed = isFollowed
        }
    }
    
    private func fetchUserTweets() {
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.userTweets = documents.map({ Tweet(dictionary: $0.data()) })
        }
    }
    
    private func fetchLikedTweets() {
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let tweetsIDs = documents.map({ $0.documentID })
            
            tweetsIDs.forEach { tweetID in
                COLLECTION_TWEETS.document(tweetID).getDocument { snapshot, _ in
                    guard let data = snapshot?.data() else { return }
                    let tweet = Tweet(dictionary: data)
                    
                    self.userLikedTweets.append(tweet)
                }
            }
        }
    }
}


