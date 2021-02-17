//
//  ContentView.swift
//  BetterRest
//
//  Created by Shohei Yamamoto on 2021/02/17.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    
    var body: some View {
        Form {
            DatePicker("Please enter a date", selection: $wakeUp,in: Date()...)
                .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
