//
//  ContentView.swift
//  WeSplit
//
//  Created by Shohei Yamamoto on 2021/02/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            // limitation of ten child view -> work around: Group
            Section {
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
            }
            Section {
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
            }
            Section {
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
                Text("Hello, world!")
                    .padding()
            }
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
