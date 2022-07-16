//
//  Item.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import Foundation

// Item Model - individual item
struct Item: Identifiable {
    let id: String
    let name: String
    let cost: Double
    let time: TimeInterval
    let sold: Bool
    let image: [Data]
    let seller: User
    let attributes: ItemAttributes
}

// Enumeration of the categories available for each product
enum ItemAttributes: String, CaseIterable, Identifiable {
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
    case Other = "Other"
    
    var id: Self { self }
}

enum ItemCondition: String, CaseIterable, Identifiable {
    case New = "New"
    case Good = "Good"
    case Poor = "Poor"
    
    var id: Self { self }
}
