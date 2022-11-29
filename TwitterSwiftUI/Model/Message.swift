//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 26.10.2022.
//

import Firebase

struct Message: Identifiable {
    let text: String
    let user: User
    let toID: String
    let fromID: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
    
    var chatPartnerId: String { return isFromCurrentUser ? toID : fromID }

    init(user: User, dictionary: [String: Any]) {
        self.user = user
        
        self.text = dictionary["text"] as? String ?? ""
        self.toID = dictionary["toID"] as? String ?? ""
        self.fromID = dictionary["fromID"] as? String ?? ""
        self.isFromCurrentUser = fromID == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["messageID"] as? String ?? ""
    }
}

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isFromCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "Hey what's up?", isFromCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "Not much, you?", isFromCurrentUser: true),
    .init(id: 2, imageName: "batman", messageText: "How is the Marvel Universe?", isFromCurrentUser: true),
    .init(id: 3, imageName: "spiderman", messageText: "It's pretty good dude", isFromCurrentUser: false),
    .init(id: 4, imageName: "spiderman", messageText: "How's your battle with the Joker?", isFromCurrentUser: false),
    .init(id: 5, imageName: "batman", messageText: "Not going so hot..", isFromCurrentUser: true),
]
