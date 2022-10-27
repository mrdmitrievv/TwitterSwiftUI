//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 24.10.2022.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $text)
                .padding(.top)
                .padding(.horizontal, 5)
            ScrollView {                                       
                    VStack(alignment: .leading) {
                        ForEach(0..<20) { _ in
                            NavigationLink(destination: UserProfileView()) {
                                HStack {
                                    UserCell()
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
