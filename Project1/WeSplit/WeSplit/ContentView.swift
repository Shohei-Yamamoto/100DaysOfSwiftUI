//
//  ContentView.swift
//  WeSplit
//
//  Created by Shohei Yamamoto on 2021/02/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                }
            }
            .navigationBarTitle("SwiftUI")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
