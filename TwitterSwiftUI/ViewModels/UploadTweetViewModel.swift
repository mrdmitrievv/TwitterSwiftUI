//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 16.11.2022.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    
    func uploadTweet(caption: String) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = ["fullname": user.fullname,
                                   "username": user.username,
                                   "uid": user.id,
                                   "caption": caption,
                                   "likes": 0,
                                   "tweetId": docRef.documentID,
                                   "timestamp": Timestamp(date: Date())
        ]
        
        docRef.setData(data) { _ in
            print("DEBUG: Successfully uploaded tweet..")
        }
    }
}