//
//  ChatViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 29.11.2022.
//

import SwiftUI
import Firebase


class ChatViewModel: ObservableObject {
    
    private let globalQueue = DispatchQueue.global()
    
    let user: User
    @Published var messages = [Message]()    
    
    init(_ user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        
        globalQueue.async {
            guard let currentUserUid = AuthViewModel.shared.userSession?.uid else { return }
            
            let query = COLLECTION_MESSAGES.document(currentUserUid).collection(self.user.id)
            query.order(by: "timestamp", descending: true)
            
            query.addSnapshotListener { snapshot, _ in
                guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
                
                changes.forEach { change in
                    let messageData = change.document.data()
                    guard let fromID = messageData["fromID"] as? String else { return }
                    
                    COLLECTION_USERS.document(fromID).getDocument { snapshot, _ in
                        guard let data = snapshot?.data() else { return }
                        let user = User(dictionary: data)
                        self.messages.append(Message(user: user, dictionary: messageData))
                        self.messages.sort(by: { $0.timestamp.dateValue() < $1.timestamp.dateValue() })
                    }
                }
            }
        }
    }
    
    func sendMessage(_ messageText: String) {
        
        globalQueue.async {
            guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
            let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(self.user.id).document()
            let receivingUserRef = COLLECTION_MESSAGES.document(self.user.id).collection(currentUid)
            let receivingRecentRef = COLLECTION_MESSAGES.document(self.user.id).collection("recent-messages")
            let currentRecentRev = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
            
            let messageID = currentUserRef.documentID
            
            let data: [String: Any] = ["fromID": currentUid,
                                       "toID": self.user.id,
                                       "text": messageText,
                                       "timestamp": Timestamp(date: Date()),
                                       "messageID": messageID]
            
            currentUserRef.setData(data)
            receivingUserRef.document(messageID).setData(data)
            receivingRecentRef.document(currentUid).setData(data)
            currentRecentRev.document(self.user.id).setData(data)
        }
    }
}

