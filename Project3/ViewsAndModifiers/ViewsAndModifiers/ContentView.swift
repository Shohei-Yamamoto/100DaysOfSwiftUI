//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Shohei Yamamoto on 2021/02/14.
//

import SwiftUI

struct GryffText: View {
    var test: String
    var body: some View {
        Text("Gryffindor! \(test)")
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .background(Color.blue)
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("body")
                .modifier(Title())
            Text("body")
                .titleStyle()
            Color.blue
                .frame(width: 200, height: 200)
                .modifier(Watermark(text: "add"))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
