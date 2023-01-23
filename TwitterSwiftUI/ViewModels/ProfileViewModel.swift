//
//  ProfileViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 11.11.2022.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    private let globalQueue = DispatchQueue.global()
    
    @Published var userTweets = [Tweet]()
    @Published var userLikedTweets = [Tweet]()
    @Published var user: User    
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserTweets()
        fetchLikedTweets()
        fetchUserStats()
    }
    
    
    
    func chooseTweets(_ filter: TweetFilterOptions) -> [Tweet] {
        let sortedTweets = userTweets.sorted { $0.timestamp.dateValue() > $1.timestamp.dateValue() }
        let sortedLikedTweets = userLikedTweets.sorted { $0.timestamp.dateValue() > $1.timestamp.dateValue() }
        
        switch filter {
        case .tweets: return sortedTweets
        case .likes: return sortedLikedTweets
        }
    }
}

// MARK: - API calls

extension ProfileViewModel {
    
    func follow() {
        globalQueue.async {
            guard let currentUid = Auth.auth().currentUser?.uid else { return }
            let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
            let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
            
            
            followingRef.document(self.user.id).setData([:]) { _ in
                followersRef.document(currentUid).setData([:]) { _ in
                    DispatchQueue.main.async {
                        self.user.isFollowed = true
                    }
                }
            }
        }
    }
    
    func unfollow() {
        globalQueue.async {
            guard let currentUid = Auth.auth().currentUser?.uid else { return }
            let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
            let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
            
            followingRef.document(self.user.id).delete { _ in
                followersRef.document(currentUid).delete { _ in
                    DispatchQueue.main.async {
                        self.user.isFollowed = false
                    }
                }
            }
        }
    }
    
    private func checkIfUserIsFollowed() {
        globalQueue.async {
            guard let currentUid = Auth.auth().currentUser?.uid else { return }
            guard !self.user.isCurrentUser else { return }
            let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
            
            followingRef.document(self.user.id).getDocument { snapshot, _ in
                guard let isFollowed = snapshot?.exists else { return }
                DispatchQueue.main.async {
                    self.user.isFollowed = isFollowed
                }
            }
        }
    }
    
    private func fetchUserTweets() {
        globalQueue.async {
            COLLECTION_TWEETS.whereField("uid", isEqualTo: self.user.id).getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                DispatchQueue.main.async {
                    self.userTweets = documents.map({ Tweet(dictionary: $0.data()) })
                }
            }            
        }
    }
    
    private func fetchLikedTweets() {
        globalQueue.async {
            COLLECTION_USERS.document(self.user.id).collection("user-likes").getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let tweetsIDs = documents.map({ $0.documentID })
                
                tweetsIDs.forEach { tweetID in
                    COLLECTION_TWEETS.document(tweetID).getDocument { snapshot, _ in
                        guard let data = snapshot?.data() else { return }
                        let tweet = Tweet(dictionary: data)
                        DispatchQueue.main.async {
                            self.userLikedTweets.append(tweet)
                        }
                    }
                }
            }
        }
    }
    
    private func fetchUserStats() {
        globalQueue.async {
            let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
            let followingRef = COLLECTION_FOLLOWING.document(self.user.id).collection("user-following")
            
            followersRef.getDocuments { snapshot, _ in
                guard let followersCount = snapshot?.documents.count else { return }
                
                followingRef.getDocuments { snapshot, _ in
                    guard let followingCount = snapshot?.documents.count else { return }
                    
                    DispatchQueue.main.async {
                        self.user.stats = UserStats(followers: followersCount, following: followingCount)
                    }                    
                }
            }
        }
    }
}

