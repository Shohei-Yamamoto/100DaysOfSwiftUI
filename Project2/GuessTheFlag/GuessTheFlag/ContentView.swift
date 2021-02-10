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
        Button("Tap me!") {
            print("tapped")
        }
        Button(action: {
            print("a")
        }, label: {
            Image(systemName: "pencil")
            Text("Tap me!")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            ContentView()
            ContentView()
                .previewDevice("iPhone X")
        }
    }
}
