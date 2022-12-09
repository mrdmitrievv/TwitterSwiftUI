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
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated    
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
    
    var detailedTimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a · MM/dd/yyyy"
        return formatter.string(from: timestamp.dateValue())
    }
}


