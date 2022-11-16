//
//  FeedViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 16.11.2022.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    
    static let shared = FeedViewModel()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        
        COLLECTION_TWEETS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.tweets = documents.map({ Tweet(dictionary: $0.data()) })
        }
        
    }
    
}
