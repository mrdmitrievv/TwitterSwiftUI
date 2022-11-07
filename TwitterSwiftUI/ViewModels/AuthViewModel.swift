//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 07.11.2022.
//

import SwiftUI
import Firebase
import FirebaseStorage

class AuthViewModel: ObservableObject {
    
    func login() {
        
    }
    
    func registerUser(email: String, fullname: String, username: String, password: String, userImage: UIImage) {
                        
        guard let imageData = userImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload immage \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = [
                        "email": email,
                        "fullname": fullname,
                        "username": username,
                        "userPhotoURL": imageUrl,
                        "uid": user.uid
                    ]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("DEBUG: SUCCESS")
                    }                    
                    
                }
            }
            
        }
    }
}
