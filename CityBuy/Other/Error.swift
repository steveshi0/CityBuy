//
//  Error.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import Foundation

// Authentification Error
enum AuthError: Error {
    case InvalidCredentials
    case SignUpFailure
    case SignOutFailure
}

// FireBase Error
enum FirebaseError: Error {
    case FireStoreError
    case FireStorageError
}
