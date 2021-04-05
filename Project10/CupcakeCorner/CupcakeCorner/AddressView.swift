//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Shohei Yamamoto on 2021/04/01.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: OrderModel
    
    
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.order.name)
                TextField("StreetAddress", text: $order.order.streetAddress)
                TextField("City", text: $order.order.city)
                TextField("Zip", text: $order.order.zip)
            }
            
            Section {
                NavigationLink(
                    destination: CheckoutView(order: order),
                    label: {
                        Text("Check out")
                    })
            }
            .disabled(order.order.hasInvalidAddress)
        }
        .navigationBarTitle("Delivery Detail", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: OrderModel(order: Order()))
    }
}
