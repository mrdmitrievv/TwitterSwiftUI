//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 27.10.2022.
//

import SwiftUI

struct UserProfileView: View {
    
    let user: User
    @State var selectedFilter: TweetFilterOptions = .tweets
    @ObservedObject var profileViewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.profileViewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(profileViewModel: profileViewModel)
            }
            
            FilterButtonView(selectedOption: $selectedFilter)
                .navigationTitle(profileViewModel.user.username)
            
            
            LazyVStack {
                ForEach(profileViewModel.chooseTweets(selectedFilter)) { tweet in
                    TweetCell(tweet: tweet)
                }
            }            
        }
    }
}


