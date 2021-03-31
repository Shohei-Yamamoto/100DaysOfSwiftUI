//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Shohei Yamamoto on 2021/03/29.
//

import SwiftUI


struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print("Creating account...")
                }
            }
            .disabled(username.isEmpty || email.isEmpty)
        }
        
        
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
