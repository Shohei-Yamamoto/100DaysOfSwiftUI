//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Shohei Yamamoto on 2021/02/14.
//

import SwiftUI

struct ContentView: View {
    // opaque return types = some View
    
    @State private var useRedText = false
    
    var body: some View {
        VStack {
            Text("hello")
            Button("Hello World") {
                print(type(of: self.body))
                useRedText = !useRedText
            }
            .frame(width: 200, height: 200)
            .background(useRedText ? Color.red : Color.blue)
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
