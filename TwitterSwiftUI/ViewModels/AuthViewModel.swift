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
    private let globalQueue = DispatchQueue.global()
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        globalQueue.async {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    print("DEBUG: Error with signIn: \(error.localizedDescription)")
                    return
                }
                
                self.userSession = result?.user
                self.fetchUser()
            }
        }
    }
    
    func registerUser(email: String, fullname: String, username: String, password: String, userImage: UIImage) {
        
        globalQueue.async {
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
                            self.fetchUser()
                        }
                        
                    }
                }
            }
        }
    }
    
    func signOut() {
        globalQueue.async {
            self.userSession = nil
            self.user = nil
            try? Auth.auth().signOut()
        }
    }
    
    func fetchUser() {
        globalQueue.async {
            guard let uid = self.userSession?.uid else { return }
            
            COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
                guard let data = snapshot?.data() else { return }
                self.user = User(dictionary: data)
            }
        }
    }
    
    func showTabTitle(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Search"
        case 2: return "Messages"
        default: return ""
        }
    }
}
