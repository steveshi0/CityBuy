//
//  Post-ViewModel.swift
//  CityBuy
//
//  Created by Steve Shi on 6/26/22.
//

import Foundation
import UIKit
import PhotosUI

class PostViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var descr: String = ""
    @Published var cost: Double = 0
    @Published var images: [UIImage] = []
    @Published var category: ItemAttributes = .Other
    @Published var condition: ItemCondition = .Good
    
    var canPost: Bool {
        !name.isEmpty && !descr.isEmpty && cost > 0 && images.count != 0
    }
    
    // Upload the user picked photos to the image publisher
    func uploadPhotoPicker(_ results: [PHPickerResult]) {
        for res in results {
            res.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { (object, error) in
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        self.images.append(image)
                        print("Selected image: \(image)")
                    }
                }
            })
        }
    }
    
    func postItem(completion: @escaping (Bool) -> Void) {
        completion(Bool.random())
    }
    
    func finishIteration() {
        name = ""
        descr = ""
        cost = 0
        images = []
        category = .Other
        condition = .Good
    }
}
