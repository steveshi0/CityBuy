//
//  Authentification.swift
//  CityBuy
//
//  Created by Steve Shi on 7/10/22.
//

import Foundation

class Authentication: ObservableObject {
    @Published var isValidated: Bool = true
    
    func updateValidation(validation: Bool) {
        DispatchQueue.main.async { [self] in
            isValidated = validation
        }
    }
}
