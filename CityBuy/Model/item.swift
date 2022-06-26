//
//  item.swift
//  CityBuy
//
//  Created by Steve Shi on 6/26/22.
//

import Foundation

struct item: Codable {
    let name: String
    let price: Double
    let attributes: [ItemAttributes]
}

enum ItemAttributes: String, Codable {
    case Home = "Home & Kitchen"
    case Beauty = "Beauty & Personal Care"
    case Toys = "Toys & Games"
    case Clothing = "Clothing, Shoes & Jewelry"
    case Health = "Health, Household & Baby Care"
    case Sports = "Sports & Outdoors"
    case Arts = "Arts, Crafts & Sewing"
    case Books = "Books"
    case Kitchen = "Kitchen & Dining"
    case Baby = "Baby"
    case Electronics = "Electronics"
}
