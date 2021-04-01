//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Shohei Yamamoto on 2021/03/29.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var order = Order()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(0..<Order.types.count){
                            Text("\(Order.types[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cupcakes \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle("Special", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        
                        Toggle("Sprinkles", isOn: $order.addSprinkles)
                        Toggle("Extra Frosting", isOn: $order.extraFrosting)
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
