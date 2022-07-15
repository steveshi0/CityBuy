//
//  Post-ViewModel.swift
//  CityBuy
//
//  Created by Steve Shi on 6/26/22.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var cost: Double = 0
    @Published var images: [Data] = []
    @Published var attributes: ItemAttributes = .Other
    
    func postItem(completion: @escaping (Bool) -> Void) {
        
    }
}
