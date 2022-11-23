//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 09.11.2022.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    private func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.map({ User(dictionary: $0.data()) })
        }
    }
    
    func filterUsers(_ query: String) -> [User] {
        let lowercaseQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercaseQuery) || $0.username.contains(lowercaseQuery) })
    }
}

