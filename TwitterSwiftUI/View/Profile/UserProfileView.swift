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
                ProfileHeaderView(profileViewModel: profileViewModel, isFollowed: $profileViewModel.isFollowed)
            }
            
            FilterButtonView(selectedOption: $selectedFilter)
                .navigationTitle(profileViewModel.user.username)
            
            LazyVStack {
                if selectedFilter == .tweets {
                    ForEach(profileViewModel.userTweets) { tweet in
                        TweetCell(tweet: tweet)
                    }
                } else if selectedFilter == .likes {
                    ForEach(profileViewModel.userLikedTweets) { tweet in
                        TweetCell(tweet: tweet)
                    }
                } else {
                    Text("No replies")
                        .padding()
                }
            }
            
        }
    }
}


