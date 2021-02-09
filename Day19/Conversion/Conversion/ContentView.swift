//
//  ContentView.swift
//  Conversion
//
//  Created by Shohei Yamamoto on 2021/02/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TemperatureConversion()
    }
}

struct TemperatureConversion: View {
    @State private var celsiusText = ""
    @State private var fahrenheitText = ""
    @State private var kelvinText = ""
    @State private var unitSelection = 0
    @State private var baseText = ""
    
    private let units = ["Celsius","Falenheit", "Kelvin"]
    private var doubled: Double {
        return Double(baseText) ?? 0
    }
    
    private func cToF(celcius: Double) -> Double{
        return celcius * 1.8 + 32
    }
    
    private func cToK(celcius: Double) -> Double {
        return celcius + 273.15
    }
    
    var body: some View {
        Form {
            Section(header: Text("Input")) {
                
                Picker("unit", selection: $unitSelection) {
                    ForEach(0 ..< units.count) {
                        Text("\(units[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                TextField("input base number", text: $baseText)
            }
            Section(header: Text("Celsius")) {
                Text("\(doubled, specifier: "%.2f")")
            }
            Section(header: Text("Falenheit")) {
                Text("\(cToF(celcius: doubled), specifier: "%.2f")")
            }
            Section(header: Text("Kelvin")) {
                Text("\(cToK(celcius: doubled), specifier: "%.2f")")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
