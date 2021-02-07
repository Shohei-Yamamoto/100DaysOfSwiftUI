//
//  ContentView.swift
//  WeSplit
//
//  Created by Shohei Yamamoto on 2021/02/07.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        Form {
            TextField("Enter your name", text: $name) // two way binding that reload if that property is changed
            Text("Hello World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
