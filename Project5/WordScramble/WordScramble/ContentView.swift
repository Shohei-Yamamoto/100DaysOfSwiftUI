//
//  ContentView.swift
//  WordScramble
//
//  Created by Shohei Yamamoto on 2021/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let input = """
            a
            b
            c
            """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        
        VStack {
            ForEach(letters, id: \.self) {
                Text("\($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
