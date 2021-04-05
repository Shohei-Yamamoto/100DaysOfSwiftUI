//
//  Order.swift
//  CupcakeCorner
//
//  Created by Shohei Yamamoto on 2021/04/01.
//

import Foundation

class OrderModel: ObservableObject {
    @Published var order: Order
    
    init(order: Order) {
        self.order = order
    }
}

struct Order: Codable {
    
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasInvalidAddress: Bool {
        return name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty || streetAddress.allSatisfy{$0 == " "}
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    init(){
        
    }
    

}
