//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 09.11.2022.
//

import SwiftUI
import Firebase

enum SearchViewModelConfiguration {
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    
    private let config: SearchViewModelConfiguration
    private let globalQueue = DispatchQueue.global()
    
    @Published var users = [User]()    
    
    init(withConfig config: SearchViewModelConfiguration) {
        self.config = config
        fetchUsers(config: config)
    }
    
    private func fetchUsers(config: SearchViewModelConfiguration) {
        
        globalQueue.async {
            COLLECTION_USERS.getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.map({ User(dictionary: $0.data()) })
                
                switch config {
                case .search:
                    DispatchQueue.main.async {
                        self.users = users
                    }
                case .newMessage:
                    DispatchQueue.main.async {
                        self.users = users.filter({ !$0.isCurrentUser })
                    }                    
                }
            }
        }        
    }
    
    func filterUsers(_ query: String) -> [User] {
        let lowercaseQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercaseQuery) || $0.username.contains(lowercaseQuery) })
    }
}

