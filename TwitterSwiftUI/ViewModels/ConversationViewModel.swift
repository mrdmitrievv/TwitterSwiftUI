//
//  ConversationViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 29.11.2022.
//

import SwiftUI
import Firebase

class ConversationViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    private var recentMessagesDictionary = [String: Message]()
    private let globalQueue = DispatchQueue.global()
    
    init() {
        fetchMessages()
    }
    
    private func fetchMessages() {
        
        globalQueue.async {
            guard let currentUserUid = AuthViewModel.shared.userSession?.uid else { return }
            
            let query = COLLECTION_MESSAGES.document(currentUserUid).collection("recent-messages")
            query.order(by: "timestamp", descending: true)
            
            query.addSnapshotListener { snapshot, _ in
                guard let changes = snapshot?.documentChanges else { return }
                
                changes.forEach { change in
                    let messageData = change.document.data()
                    let uid = change.document.documentID
                    
                    COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
                        guard let data = snapshot?.data() else { return }
                        let user = User(dictionary: data)
                        self.recentMessagesDictionary[uid] = Message(user: user, dictionary: messageData)
                        
                        self.recentMessages = Array(self.recentMessagesDictionary.values)
                    }
                }
            }
        }
    }
}
