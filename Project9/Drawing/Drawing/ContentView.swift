//
//  ContentView.swift
//  Drawing
//
//  Created by Shohei Yamamoto on 2021/03/13.
//

import SwiftUI

struct Arrow: Shape {
    let headHeight: CGFloat
    var lineTickness: CGFloat
    
    var animatableData: CGFloat {
        get { lineTickness }
        set { self.lineTickness = newValue }
    }
    
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

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 2)
            }
        }
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}
struct ContentView: View {
    @State private var colorCycle = 0.0

    var body: some View {
        VStack {
            ColorCyclingCircle(amount: self.colorCycle)
                .frame(width: 300, height: 300)

            Slider(value: $colorCycle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
