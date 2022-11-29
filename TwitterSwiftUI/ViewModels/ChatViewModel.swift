//
//  ChatViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 29.11.2022.
//

import SwiftUI
import Firebase


class ChatViewModel: ObservableObject {
    
    let user: User
    
    init(_ user: User) {
        self.user = user
    }
    
    func fetchMessages() {}
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let receivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRev = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        
        let messageID = currentUserRef.documentID
        
        let data: [String: Any] = ["fromID": currentUid,
                                   "toID": user.id,
                                   "text": messageText,
                                   "timestamp": Timestamp(date: Date()),
                                   "messageID": messageID]
        
        currentUserRef.setData(data)
        receivingUserRef.document(messageID).setData(data)
        receivingRecentRef.document(currentUid).setData(data)
        currentRecentRev.document(user.id).setData(data)
        
    }
}

