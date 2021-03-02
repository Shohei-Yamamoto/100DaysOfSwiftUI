//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Shohei Yamamoto on 2021/03/02.
//

import SwiftUI

enum QuestionCount: Hashable {
    case int(count: Int)
    case all
    
    var text: String {
        switch self {
        case .int(let count):
            return String(count)
        case .all:
            return "All"
        }
    }
    
    var numbers: [Int] {
        switch self {
        case .int(let count) :
            return [Int](1...count).map{ _ in Int.random(in: 1...12)}
        case .all:
            return [Int](1...12).shuffled()
        }
    }
}

struct ContentView: View {
    @State private var tableNumber: Int = 1
    @State private var questionCount = 0
    @State private var isSetting = false
    let questionCounts: [QuestionCount] = [.int(count: 5), .int(count: 10), .int(count: 20), .all]
    
    var body: some View {
        if isSetting {
            Group {
                Form {
                    Section(header: Text("Which multiplication table you want to play? (1~12)")) {
                        Stepper("\(tableNumber)", value: $tableNumber, in: 1...12)
                    }
                    
                    Section(header: Text("How many questions?")) {
                        Picker(selection: $questionCount, label: Text("")) {
                            ForEach(0 ..< questionCounts.count) { count in
                                Text("\(questionCounts[count].text)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Button("Start Game!") {
                        isSetting = false
                    }
                }
            }
        } else {
            QuestionView(base: tableNumber, anothers: questionCounts[questionCount].numbers) {
                isSetting = true
            }
        }
    }
}

struct QuestionView: View {
    let base: Int
    let anothers: [Int]
    @State var current = 0
    @State var corrected = 0
    @State var answer = ""
    @State var message = ""
    @State var gameEnded = false
    
    let completed: () -> ()
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("\(base)")
                    .font(.largeTitle)
                Text("x")
                Text("\(anothers[current])")
                    .font(.largeTitle)
            }
            
            Text("\(message)")
            Spacer()
            TextField("Your answer", text: $answer)
                .keyboardType(.numberPad)
                .padding([.bottom, .top], 30)
            
            Button("Answer") {
                if Int(answer) == base * anothers[current] {
                    message = "You are right!"
                    corrected += 1
                } else {
                    message = "Try next!"
                }
                
                if (current + 1) == anothers.count {
                    gameEnded = true
                    return
                }
                
                current += 1
                answer = ""
            }
                
        }.padding()
        .alert(isPresented: $gameEnded){
            Alert(title: Text("Your Score"), message: Text("\(corrected)/\(anothers.count)"), dismissButton: .default(Text("OK")) {
                completed()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
