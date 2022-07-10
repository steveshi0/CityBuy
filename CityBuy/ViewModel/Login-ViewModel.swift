//
//  Login-ViewModel.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var loggedIn: Bool = false
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var loginError: Bool = false
    
    init() {
        checkLogState()
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        AuthManager.shared.signIn(email: username, password: password) { res in
            completion(res)
        }
    }
    func signUp(email: String, password: String, completion: @escaping (Bool) -> Void) {
        AuthManager.shared.signUp(email: email, password: password) { res in
            completion(res)
        }
    }
    func signOut(completion: @escaping (Bool) -> Void) {
        AuthManager.shared.signOut { res in
            completion(res)
        }
    }
    func resetPassword(email: String, completion: @escaping (Bool) -> Void) {
        AuthManager.shared.resetPassword(email: email) { res in
            completion(res)
        }
    }
    
    // Check to see if the user was previously signed in
    func checkLogState() {
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            loggedIn = true
        }
    }
}
