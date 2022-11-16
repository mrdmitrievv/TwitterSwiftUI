//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 07.11.2022.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    
    @Published var userSession: Firebase.User?
    @Published var isAuthentificating = false
    @Published var error: Error?
    @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
        
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error with signIn: \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
        }
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
                        "username": username.lowercased(),
                        "userPhotoURL": imageUrl,
                        "uid": user.uid
                    ]
                    
                    COLLECTION_USERS.document(user.uid).setData(data) { _ in
                        self.userSession = user
                    }
                    
                }
            }
            
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }

        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)
        }
    }
}
