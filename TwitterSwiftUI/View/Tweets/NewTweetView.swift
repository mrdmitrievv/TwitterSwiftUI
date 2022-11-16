//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 28.10.2022.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @State var text: String = ""
    @ObservedObject var uploadTweetViewModel: UploadTweetViewModel
    @Binding var isNewTweetViewShown: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isNewTweetViewShown = isPresented
        self.uploadTweetViewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.userPhotoURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 56, height: 56)
                            .clipShape(Circle())
                            .padding(.trailing, 5)
                    }
                    
                    TextArea("What's happening?", text: $text)
                    
                    Spacer()
                }
                .padding()
                
                .navigationBarItems(
                    leading:
                        Button(action: { isNewTweetViewShown.toggle() }, label: {
                            Text("Cancel")
                                .fontWeight(.bold)
                        }),
                    trailing:
                        Button(action: {
                            uploadTweetViewModel.uploadTweet(caption: text)
                            FeedViewModel.shared.fetchTweets()
                        }, label: {
                            Text("Tweet")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        })
                )
            }
        }
    }
}
