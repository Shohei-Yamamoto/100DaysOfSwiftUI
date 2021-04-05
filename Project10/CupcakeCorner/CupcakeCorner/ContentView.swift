//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Shohei Yamamoto on 2021/03/29.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var order = OrderModel(order: Order())
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.order.type){
                        ForEach(0..<Order.types.count){
                            Text("\(Order.types[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Stepper(value: $order.order.quantity, in: 3...20) {
                        Text("Number of cupcakes \(order.order.quantity)")
                    }
                }
                
                Section {
                    Toggle("Special", isOn: $order.order.specialRequestEnabled.animation())
                    
                    if order.order.specialRequestEnabled {
                        
                        Toggle("Sprinkles", isOn: $order.order.addSprinkles)
                        Toggle("Extra Frosting", isOn: $order.order.extraFrosting)
                    }
                    
                }
                
                Section {
                    NavigationLink(
                        destination: AddressView(order: order),
                        label: {
                            Text("Delivery Details")
                        })
                }
                
            }
            .navigationTitle("Cupcake Corner")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
