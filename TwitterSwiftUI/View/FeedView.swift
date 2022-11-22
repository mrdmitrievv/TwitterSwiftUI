//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 20.10.2022.
//

import SwiftUI

struct FeedView: View {
        
    @State var newTweetText = "..."
    @State var isNewTweetViewPresented = false
    @ObservedObject var feedViewModel = FeedViewModel.shared
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(feedViewModel.tweets) { tweet in
                        NavigationLink(destination: LazyView(TweetDetailsView(tweet: tweet))) {
                            TweetCell(tweet: tweet)
                        }
                    }
                }
                .padding(.top)
            }
            
            Button(action: { isNewTweetViewPresented.toggle() }) {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .background(Color(UIColor(red: 0, green: 172/255, blue: 230/255, alpha: 1)))
            .foregroundColor(.white)
            .clipShape(Circle())
            .fullScreenCover(isPresented: $isNewTweetViewPresented) {
                NewTweetView(isPresented: $isNewTweetViewPresented)
            }
            .padding()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
