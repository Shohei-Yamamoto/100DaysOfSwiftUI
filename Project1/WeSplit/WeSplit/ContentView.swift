//
//  ContentView.swift
//  WeSplit
//
//  Created by Shohei Yamamoto on 2021/02/07.
//

import SwiftUI

struct ContentView: View {
    
    // text
    @State private var checkAmount = ""
    @State private var numberOfPeopleText = ""
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeopleText) ?? 1
        return totalAmount / peopleCount
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of people", text: $numberOfPeopleText)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                    ForEach(["a", "b", "a"], id: \.self, content: {
                        Text($0)
                    })
                }
                
                Section(header: Text("Total Amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                        .foregroundColor( tipPercentages[tipPercentage] == 0 ? Color.red : Color.primary)
                }
                
            }
            .navigationTitle("WeSplit")
            // not attached to the end of the NavigationView, but inside view. Because the navigation can change titles freely.
        }
        
    }
    

}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
