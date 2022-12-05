//
//  NewMessageView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 26.10.2022.
//

import SwiftUI

struct NewMessageView: View {
    @State var text = ""
    @Binding var isShown: Bool
    @Binding var isChatViewShown: Bool
    @Binding var user: User?
    @ObservedObject var searchViewModel = SearchViewModel(withConfig: .newMessage)
    
    var body: some View {
        VStack {
            SearchBar(text: $text)
                .padding(.top)
                .padding(.horizontal, 5)
            ScrollView {
                    VStack(alignment: .leading) {
                        
                        ForEach( text.isEmpty ? searchViewModel.users : searchViewModel.filterUsers(text) ) { user in
                            Button(action: {
                                isShown.toggle()
                                isChatViewShown.toggle()
                                self.user = user
                            }) {
                                UserCell(user: user)
                                HStack {
                                    Spacer()
                                }
                            }                            
                        }
                        .padding(.leading)
                    }
                    .foregroundColor(.black)
            }
        }
        
        
    }
}


