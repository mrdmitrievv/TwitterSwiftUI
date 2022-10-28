//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 28.10.2022.
//

import SwiftUI

struct NewTweetView: View {
    
    @Binding var isNewTweetViewShown: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("spiderman")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                        .padding(.trailing, 5)
                    
                    Text("What's happening?")
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                .navigationBarItems(
                    leading:
                        Button(action: { isNewTweetViewShown.toggle() }, label: {
                            Text("Cancel")
                                .fontWeight(.bold)
                        }),
                    trailing:
                        Button(action: {}, label: {
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

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isNewTweetViewShown: .constant(true))
    }
}
