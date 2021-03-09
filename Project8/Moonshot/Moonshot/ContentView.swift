//
//  ContentView.swift
//  Moonshot
//
//  Created by Shohei Yamamoto on 2021/03/08.
//

import SwiftUI


struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        
        Text("\(astronauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
