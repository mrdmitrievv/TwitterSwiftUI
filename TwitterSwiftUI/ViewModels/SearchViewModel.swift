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
    @Published var users = [User]()
    private let config: SearchViewModelConfiguration
    
    init(withConfig config: SearchViewModelConfiguration) {
        self.config = config
        fetchUsers(config: config)
    }
    
    private func fetchUsers(config: SearchViewModelConfiguration) {
        
        
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let users = documents.map({ User(dictionary: $0.data()) })
            
            switch config {
            case .search: self.users = users
            case .newMessage: self.users = users.filter({ !$0.isCurrentUser })
            }            
        }
    }
    
    func filterUsers(_ query: String) -> [User] {
        let lowercaseQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercaseQuery) || $0.username.contains(lowercaseQuery) })
    }
}

