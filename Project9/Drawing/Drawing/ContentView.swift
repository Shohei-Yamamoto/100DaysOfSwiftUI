//
//  ContentView.swift
//  Drawing
//
//  Created by Shohei Yamamoto on 2021/03/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path {path in
            path.move(to: CGPoint(x:200, y:100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
        }
        .stroke(Color.blue.opacity(0.3),style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
