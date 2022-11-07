//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 20.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    let uiColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    
    init(){
        UITabBar.appearance().backgroundColor = uiColor
        }
    
    var body: some View {
        
        Group {
            if authViewModel.userSession != nil {
                NavigationView {
                    TabView {
                        FeedView()
                            .tabItem {
                                Text("Home")
                                Image(systemName: "house")
                            }
                        
                        SearchView()
                            .tabItem {
                                Text("Search")
                                Image(systemName: "magnifyingglass")
                            }
                        
                        ConversationView()
                            .tabItem {
                                Text("Messages")
                                Image(systemName: "envelope")
                            }
                    }
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(Color(uiColor: uiColor), for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                }
            } else {
                LoginView()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
