//
//  ContentView.swift
//  Drawing
//
//  Created by Shohei Yamamoto on 2021/03/13.
//

import SwiftUI

struct Arrow: Shape {
    let headHeight: CGFloat
    let lineTickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX - rect.width/2, y: rect.minY + headHeight/2))
        path.addLine(to: CGPoint(x: rect.midX - lineTickness/2, y: rect.minY + headHeight/2))
        path.addLine(to: CGPoint(x: rect.midX - lineTickness/2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + lineTickness/2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + lineTickness/2, y: rect.minY + headHeight/2))
        path.addLine(to: CGPoint(x: rect.midX + rect.width/2, y: rect.minY + headHeight/2))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}
struct ContentView: View {
    
    var body: some View {
        Arrow(headHeight: 100 ,lineTickness: 50)
            .frame(width: 110, height: 200)
            .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
