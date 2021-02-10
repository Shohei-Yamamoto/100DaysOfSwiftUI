//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Shohei Yamamoto on 2021/02/10.
//

// resources: https://github.com/twostraws/HackingWithSwift

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        
        
        Button("showing Alert"){
            self.showingAlert = true
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello Swift UI!"), message: Text("detail message"), dismissButton: .default(Text("OK")))
        }
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
