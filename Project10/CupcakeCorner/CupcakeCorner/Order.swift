//
//  Order.swift
//  CupcakeCorner
//
//  Created by Shohei Yamamoto on 2021/04/01.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasInvalidAddress: Bool {
        return name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty
    }
    
    
}
