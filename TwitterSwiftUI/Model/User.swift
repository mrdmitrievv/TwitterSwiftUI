//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 08.11.2022.
//

import Firebase

struct User: Identifiable {
    let id: String
    let email: String
    let fullname: String
    let username: String
    let userPhotoURL: String
    var stats: UserStats
    var isFollowed: Bool
    
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.userPhotoURL = dictionary["userPhotoURL"] as? String ?? ""
        self.stats = UserStats(followers: 0, following: 0)
        self.isFollowed = false
    }
}

struct UserStats {
    let followers: Int
    let following: Int
}
