//
//  ContentView.swift
//  Moonshot
//
//  Created by Shohei Yamamoto on 2021/03/08.
//

import SwiftUI

struct CustomText: View {
    var text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink(
                    destination: Text("Detail \(row)"),
                    label: {
                        Text("Navigate \(row)")
                    })
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
