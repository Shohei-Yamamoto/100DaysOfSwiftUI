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
//            Color.yellow // safe areaだけ
//            Color.yellow.frame(width: 200, height: 200, alignment:  .center) // 指定
            Color.yellow.edgesIgnoringSafeArea(.all) // safe area外も
            HStack(alignment: .top, spacing: 20) {
                Text("Hello World")
                Text("Hello World")
                ZStack {
                    Color.yellow.frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("Hello World")
                    Text("hello world")
                        .background(Color.red)
                }
            }
            HStack {
                Spacer()
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
            HStack {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }             .background(Color.green)

        }
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
