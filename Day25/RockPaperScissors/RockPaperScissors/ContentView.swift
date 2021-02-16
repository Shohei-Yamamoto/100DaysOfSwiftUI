//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Shohei Yamamoto on 2021/02/16.
//

import SwiftUI

struct ContentView: View {
    let hands = Hand.allCases
    @State private var handIndex = Int.random(in: 0..<Hand.allCases.count)
    
    @State private var results: [RPCResult] = [.win, .lose].shuffled()
    
    @State private var count = 0
    @State private var points = 0
    @State private var gameEnded = false
    var body: some View {
        VStack {
            Text("Hello, world! count: \(count), point: \(points)")
                .padding()
            
            Text("You have to \(results[0].rawValue) to \(hands[handIndex].rawValue)")
            
            HStack {
                ForEach(Hand.allCases, id: \.self) { hand in
                    Button(action: {
                        tapped(hand: hand)
                    }, label: {
                        Image(hand.rawValue)
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .background(Color.green)
                    })
                }
            }.alert(isPresented: $gameEnded) {
                Alert(title: Text("終了!")
                      , message: Text("結果は\(count)試合中\(points)勝でした"), dismissButton: .default(Text("OK")){
                        count = 0
                        points = 0
                        gameEnded = false
                        
                      })
            }
        }
    }
    
    func tapped(hand: Hand) {
        if hand.result(to: hands[handIndex]) == results[0] {
            points += 1
        }
        count += 1
        initQuestion()
        
        if count >= 10 {
            gameEnded = true
        }
    }
    
    
    
    func initQuestion(){
        results = results.shuffled()
        handIndex = Int.random(in: 0..<Hand.allCases.count)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



enum Hand: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    func result(to hand: Hand) -> RPCResult{
        switch (self, hand) {
        case _ where self.rawValue == hand.rawValue:
            return .draw
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        default:
            return .lose
        }
    }
}

enum RPCResult: String {
    case win
    case draw
    case lose
}



