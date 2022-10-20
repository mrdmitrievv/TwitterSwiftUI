//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 20.10.2022.
//

import SwiftUI

struct ContentView: View {
    
//    init(){
//        UINavigationBar.appearance().backgroundColor = .gray
//        UITabBar.appearance().backgroundColor = .gray
//        }
    
    var body: some View {
        
        NavigationView {
            TabView {
                Text("Feed")
                    .tabItem {
                        Text("Home")
                        Image(systemName: "house")
                    }
                
                Text("Search View")
                    .tabItem {
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                    }
                
                Text("Messages")
                    .tabItem {
                        Text("Messages")
                        Image(systemName: "envelope")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
