//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Shohei Yamamoto on 2021/02/10.
//

// resources: https://github.com/twostraws/HackingWithSwift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10
        ) {
            HStack(alignment: .top, spacing: 20) {
                Text("Hello World")
                Text("Hello World")
                ZStack {
                    Text("Hello World")
                    Text("hello world")
                }
            }
            HStack {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
            HStack {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
