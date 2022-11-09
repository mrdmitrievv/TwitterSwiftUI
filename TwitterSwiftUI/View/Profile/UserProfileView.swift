//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 27.10.2022.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var selectedFilter: TweetFilterOptions = .tweets
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
            }
            
            FilterButtonView(selectedOption: $selectedFilter)
            
            .navigationTitle("batman")
        }
        
        
    }
}


