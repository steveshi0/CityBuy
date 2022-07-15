//
//  User.swift
//  CityBuy
//
//  Created by Steve Shi on 7/3/22.
//

import Foundation
import Firebase

struct User: Identifiable {
    let id: String
    let name: String
    let location: GeoPoint
}
