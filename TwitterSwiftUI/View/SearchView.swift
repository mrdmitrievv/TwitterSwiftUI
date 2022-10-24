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
        ScrollView {
            VStack {
                SearchBar(text: $text)
                    .padding()
                
                ForEach(0..<20) { _ in
                    Text("Add users here")
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
