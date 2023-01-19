//
//  TweetDetailsViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 19.01.2023.
//

import SwiftUI

class TweetDetailsViewModel: ObservableObject {
    
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
}

