//
//  ContentView.swift
//  WordScramble
//
//  Created by Shohei Yamamoto on 2021/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List(0..<5) {
                Text("Dynamic \($0)")
            }
            
            
            List {
                
                Section(header: Text("Section 1")){
                    Text("Hello")
                    Text("Hello")
                    Text("Hello")
                }
                
                Section(header: Text("Section 2")){
                    ForEach(0..<5) {
                        Text("Dynamic row \($0)")
                    }
                }
                
                Section(header: Text("Section 3")){
                    Text("Hello")
                    Text("Hello")
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
