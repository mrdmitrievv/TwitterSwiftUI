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
    let user: User    
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(user.id).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).setData([:]) { _ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        
    }
}


