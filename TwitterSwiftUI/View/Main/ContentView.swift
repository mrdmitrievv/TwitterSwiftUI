//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 20.10.2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var selectedIndex = 0
    
    let uiColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    
    init(){
        UITabBar.appearance().backgroundColor = uiColor
    }
    
    var body: some View {
        
        Group {
            if authViewModel.userSession != nil {
                NavigationView {
                    MainTabView(selectedIndex: $selectedIndex)
                        .navigationBarTitle(authViewModel.showTabTitle(for: selectedIndex))
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(leading: Button(action: { authViewModel.signOut() }, label: {
                            if let user = authViewModel.user {
                                KFImage(URL(string: user.userPhotoURL))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 32, height: 32)
                                    .clipShape(Circle())
                                    .clipped()
                            }
                        }))
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
