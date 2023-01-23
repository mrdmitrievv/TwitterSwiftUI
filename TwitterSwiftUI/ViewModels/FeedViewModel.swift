//
//  FeedViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 16.11.2022.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    private let globalQueue = DispatchQueue.global()
    
    static let shared = FeedViewModel()
    
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        
        globalQueue.async {
            COLLECTION_TWEETS.getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                DispatchQueue.main.async {
                    self.tweets = documents.map({ Tweet(dictionary: $0.data()) })
                }                
            }
        }
    }
}
