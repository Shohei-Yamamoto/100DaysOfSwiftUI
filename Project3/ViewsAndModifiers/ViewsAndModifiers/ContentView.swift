//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Shohei Yamamoto on 2021/02/14.
//

import SwiftUI

struct ContentView: View {
    // opaque return types = some View
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("numquam titillandus")
    
    @State private var useRedText = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Gryffindor")
                    .blur(radius: 0)
                Text("Hufflepuff")
            }
            .blur(radius: 3)
            // blur is a regular modifier
            
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                Text("Hufflepuff")
                motto1
                motto2
            }
            .font(.title3)
            // font is an Environment modifier
        }
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
