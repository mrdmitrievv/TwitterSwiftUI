//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 24.10.2022.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @ObservedObject var searchViewModel = SearchViewModel(withConfig: .search)
    
    var body: some View {
        VStack {
            SearchBar(text: $text)
                .padding(.top)
                .padding(.horizontal, 5)
            ScrollView {                                       
                    VStack(alignment: .leading) {
                        ForEach( text.isEmpty ? searchViewModel.users : searchViewModel.filterUsers(text) ) { user in
                            NavigationLink(destination: LazyView(UserProfileView(user: user))) {
                                HStack {
                                    UserCell(user: user)
                                    Spacer()
                                }
                            }
                        }.padding(.leading)
                    }
            }
        }
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
