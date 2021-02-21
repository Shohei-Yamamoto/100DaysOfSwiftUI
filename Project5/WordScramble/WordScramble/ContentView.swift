//
//  ContentView.swift
//  WordScramble
//
//  Created by Shohei Yamamoto on 2021/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                Text(fileContents)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
