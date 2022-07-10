//
//  LoginService.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    static let shared = AuthManager()
    
    private let auth = Auth.auth()
    
    private init() {}
    
    public func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        auth.signIn(withEmail: email, password: password) { res, err in
            guard res != nil, err == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    public func signUp(email: String, password: String, completion: @escaping (Bool) -> Void) {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
                password.count > 7 else {
            return
        }
        
        auth.createUser(withEmail: email, password: password) { res, err in
            guard res != nil, err == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    public func signOut(completion: @escaping (Bool) -> Void) {
        do {
            try auth.signOut()
            completion(true)
        } catch {
            print(error)
            completion(false)
        }
    }
    
    public func resetPassword(email: String, completion: @escaping (Bool) -> Void) {
        auth.sendPasswordReset(withEmail: email) { err in
            if err == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
