//
//  Authentification.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import Foundation

class Authentification: ObservableObject {
    @Published var isValidated: Bool = false
    
    func updateValidation(validation: Bool) {
        DispatchQueue.main.async { [self] in
            isValidated = validation
        }
    }
}
