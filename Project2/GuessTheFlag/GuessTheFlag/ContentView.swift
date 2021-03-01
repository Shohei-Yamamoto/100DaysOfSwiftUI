//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Shohei Yamamoto on 2021/02/10.
//

// resources: https://github.com/twostraws/HackingWithSwift

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        .shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var rotateAngle: Angle = .zero
    @State private var wrongOpacity: Double = 1.0
    @State private var wrongAngle: Angle = .zero
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) {
                    FlagImage(country: self.countries[$0], number: $0, action: self.flagTapped(_:))
                        .opacity(correctAnswer != $0 ? wrongOpacity : 1.0)
                        .rotation3DEffect(
                            correctAnswer != $0 ? wrongAngle : .zero,
                            axis: (x: 0.0, y: 0.0, z: 1.0))
                        .rotation3DEffect(
                            rotateAngle,
                            axis: (x: 0.0, y: 1.0, z: 0.0))
                        .animation(correctAnswer == $0 ? .default: nil)
                        
                }
                Text("Your score is \(score) now")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore)
        {
            Alert(title: Text(scoreTitle), message: Text("Your Score is \(score)"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            withAnimation {
                rotateAngle.degrees += 360
            }
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            wrongAngle.degrees += 30
        }
        wrongOpacity = 0.25
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        wrongOpacity = 1.0
        wrongAngle = .zero

        
    }
}

struct FlagImage: View {
    let country: String
    let number: Int
    let action: (Int) -> Void
    
    var body: some View {
        Button(action: {
            self.action(number)
        }, label: {
            Image(self.country)
                .renderingMode(.original)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 2))
                .shadow(color: .black, radius: 2)
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
