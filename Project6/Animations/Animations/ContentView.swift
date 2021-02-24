//
//  ContentView.swift
//  Animations
//
//  Created by Shohei Yamamoto on 2021/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount:CGFloat = 1
    
    var body: some View {
        Button("Tap me") {
            self.animationAmount += 1
            
        }
        .padding(50)
        .foregroundColor(.white)
        .background(Color.red)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
