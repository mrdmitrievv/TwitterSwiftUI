//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 26.10.2022.
//

import Foundation

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
