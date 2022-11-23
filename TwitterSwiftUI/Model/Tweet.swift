//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 16.11.2022.
//

import Firebase

struct Tweet: Identifiable {
    
    let id: String
    let fullname: String
    let username: String
    let userPhotoURL: String
    let caption: String
    let timestamp: Timestamp
    let likes: Int
    let uid: String
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["tweetId"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.userPhotoURL = dictionary["userPhotoUrl"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.likes = dictionary["likes"] as? Int ?? 0
        self.uid = dictionary["uid"] as? String ?? "" 
    }
}

let myDictionary: [String: Any] = [
    "id": "1",
    "fullname": "Tim Cook",
    "username": "timcook",
    "userPhotoUrl": "https://firebasestorage.googleapis.com:443/v0/b/twitterswiftui-ac25f.appspot.com/o/1779864E-951C-4518-B969-0B6013CF6169?alt=media&token=a10beca5-ca35-4c6c-b366-eea8b601ec6e",
    "caption": "test tweet",
    "timestamp": Timestamp(date: Date()),
    "likes": 0,
    "uid": "2"
]
