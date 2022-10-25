//
//  ConversationView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 25.10.2022.
//

import SwiftUI

struct ConversationView: View {
    @State var isShowingNewMessageView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<30) { _ in
                        NavigationLink(destination: Text("Chat view")) {
                            ConversationCell()
                        }
                    }
                }
                .padding(.vertical)                
            }
            
            Button(action: { isShowingNewMessageView.toggle() }) {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .background(Color(UIColor(red: 0, green: 172/255, blue: 230/255, alpha: 1)))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView) {
                SearchView()
            }
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
