//
//  ContentView.swift
//  iExpense
//
//  Created by Shohei Yamamoto on 2021/03/03.
//

import SwiftUI


struct SecondView: View {
    var name: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show sheet") {
            self.showingSheet.toggle()
        }.sheet(isPresented: $showingSheet, content: {
            SecondView(name: "shohei")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
