//
//  ContentView.swift
//  WeSplit
//
//  Created by Shohei Yamamoto on 2021/02/07.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]

    @State private var selectedStudent = 0
    var body: some View {
        VStack {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose: Student # \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
