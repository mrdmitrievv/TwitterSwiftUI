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
    @ObservedObject var searchViewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $text)
                .padding(.top)
                .padding(.horizontal, 5)
            ScrollView {
                    VStack(alignment: .leading) {
                        
                        ForEach(searchViewModel.users) { user in
                            Button(action: {
                                isShown.toggle()
                                isChatViewShown.toggle()
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

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(isShown: .constant(false), isChatViewShown: .constant(false))
    }
}
