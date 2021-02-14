//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Shohei Yamamoto on 2021/02/14.
//

import SwiftUI



struct LargeBlueFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeBlueFont() -> some View {
        self.modifier(LargeBlueFont())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("a")
                .modifier(LargeBlueFont())
            Text("b")
                .largeBlueFont()
        }
            
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
