//
//  Item.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import Foundation

// Item Model - individual item
struct Item: Codable {
    let name: String
    let cost: Double
    let time: String
    let sold: Bool
    let image: [Data]
    let attributes: ItemAttributes
}

// Enumeration of the categories available for each product
enum ItemAttributes: String, Codable, CaseIterable {
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
