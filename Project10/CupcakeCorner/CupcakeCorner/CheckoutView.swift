//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Shohei Yamamoto on 2021/04/01.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: OrderModel
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width)
                Text("Your total is $\(self.order.order.cost, specifier: "%.2f")")
                    .font(.title)
                Button("Place Order") {
                    self.placeOrder()
                }.padding()
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation, content: {
            Alert(title: Text("Thank you!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        })
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order.order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                confirmationMessage = "Error: Please check Network Connection"
                showingConfirmation = true
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way"
                self.showingConfirmation = true
            } else {
                print("Invalid response from server")
            }
        }.resume()
        
    }
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: OrderModel(order: Order()))
    }
}
