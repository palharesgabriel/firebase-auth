//
//  AuthManager.swift
//  firebase-auth
//
//  Created by Gabriel Palhares on 18/11/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {}
    
    func register(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion:{ user, error in
            if let firebaseError = error {
                print(firebaseError.localizedDescription)
                completion(false)
                return
            }
            completion(true)
        })
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion:{ user, error in
            if let firebaseError = error {
                print(firebaseError.localizedDescription)
                completion(false)
                return
            }
            completion(true)
        })
    }
    
    func logOut(completion: @escaping (Bool) -> Void ) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            completion(false)
        }
    }
    
    func isLogged(completion: @escaping (Bool) -> Void) {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                completion(false)
                return
            } else {
                completion(true)
            }
        }
    }
    
    func returnUserLogged() -> String? {
        var chave: String?
        if let email = Auth.auth().currentUser?.email {
//            chave = Base64().convertStringToBase64(text: email)
        }
        return chave
    }
    
}
