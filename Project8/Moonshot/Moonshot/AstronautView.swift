//
//  AstronautView.swift
//  Moonshot
//
//  Created by Shohei Yamamoto on 2021/03/11.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    Text(self.astronaut.description)
                        .padding()
                    
                    Text("missions")
                        .font(.headline)
                    
                    List(missions(of: astronaut)) { mission in
                        Text(mission.displayName)
                    }
                    
                    
                }
            }
            .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
            
        }
    }
    
    func missions(of astronaut: Astronaut) -> [Mission] {
        return missions.filter{ $0.crew.contains(where: {
            $0.name == astronaut.id
        }) }
    }
}


struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
