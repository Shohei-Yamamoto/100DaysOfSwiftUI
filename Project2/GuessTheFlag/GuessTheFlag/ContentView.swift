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
        LinearGradient(gradient: Gradient(colors: [.black,.white]), startPoint: .leading, endPoint: .trailing)
        RadialGradient(gradient: Gradient(colors: [.red, .yellow]), center: .center, startRadius: 5
                       , endRadius: 500)
        AngularGradient(gradient: Gradient(colors: [.yellow,.red,.blue,.green, .purple]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/ )
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
