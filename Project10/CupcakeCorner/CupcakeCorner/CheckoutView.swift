//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Shohei Yamamoto on 2021/04/01.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width)
                Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                    .font(.title)
                Button("Place Order") {
                    
                }.padding()
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
    }
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
