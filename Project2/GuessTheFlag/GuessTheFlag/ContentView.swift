//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Shohei Yamamoto on 2021/02/10.
//

// resources: https://github.com/twostraws/HackingWithSwift

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        VStack(spacing: 30) {
            VStack {
                Text("Tap the flag of")
                Text(countries[correctAnswer])
            }
            ForEach(0 ..< 3) {
                number in
                Button(action: {}, label: {
                    Image(self.countries[number])
                        .renderingMode(.original)
                })
            }
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
