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
        let now = Date()
        let tomorrow = Date().addingTimeInterval(60 * 60 * 24)
        
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date =  Calendar.current.date(from: components) ?? Date()
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: date)
        
        
        
        return Form {
            Text("\(dateString)")
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
