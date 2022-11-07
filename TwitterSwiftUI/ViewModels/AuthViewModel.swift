//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 07.11.2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    func login() {
        
    }
    
    func registerUser(email: String, fullname: String, username: String, password: String, userImage: UIImage) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            print("Successfully registered..")
        }
        
    }
    
}
