//
//  PracticeView.swift
//  Bookworm
//
//  Created by Shohei Yamamoto on 2021/04/07.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }.padding()
        .background(LinearGradient(gradient: Gradient(colors:  isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5 )
        
    }
}

struct PracticeView: View {
    @State private var rememberMe = false
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
