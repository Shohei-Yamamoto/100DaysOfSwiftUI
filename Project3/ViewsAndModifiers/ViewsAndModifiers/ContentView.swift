//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Shohei Yamamoto on 2021/02/14.
//

import SwiftUI

struct ContentView: View {
    // opaque return types = some View
    var body: some View {
        VStack {
            Text("hello")
            Button("Hello World") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(Color.red)
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
