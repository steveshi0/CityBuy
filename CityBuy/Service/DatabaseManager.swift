//
//  DatabaseManager.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let db = Firestore.firestore()
    
    private init() {}
    
    public func postItem(item: Item, completion: @escaping (Bool) -> Void) {
        
    }
    public func deleteItem(item: Item, completion: @escaping (Bool) -> Void) {
        
    }
    public func editItem(item: Item, completion: @escaping (Bool) -> Void) {
        
    }
}
