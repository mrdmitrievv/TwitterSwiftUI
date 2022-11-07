//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 20.10.2022.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel())
        }
    }
}
