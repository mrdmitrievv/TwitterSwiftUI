//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 16.11.2022.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    
    private let globalQueue = DispatchQueue.global()
    
    @Binding var isPresented: Bool    
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadTweet(caption: String) {
        
        globalQueue.async {
            guard let user = AuthViewModel.shared.user else { return }
            let docRef = COLLECTION_TWEETS.document()
            
            let data: [String: Any] = ["fullname": user.fullname,
                                       "username": user.username,
                                       "uid": user.id,
                                       "caption": caption,
                                       "userPhotoUrl": user.userPhotoURL,
                                       "likes": 0,
                                       "tweetId": docRef.documentID,
                                       "timestamp": Timestamp(date: Date())
            ]
            
            docRef.setData(data) { _ in
                print("DEBUG: Successfully uploaded tweet..")
                DispatchQueue.main.async {
                    self.isPresented = false
                }                
            }
        }        
    }
}
