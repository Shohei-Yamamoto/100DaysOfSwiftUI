//
//  ContentView.swift
//  Moonshot
//
//  Created by Shohei Yamamoto on 2021/03/08.
//

import SwiftUI


struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isDate = true

    
    var body: some View {
        
        NavigationView {
            List(missions) {mission in
                
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(isDate ? mission.formattedLaunchDate: mission.crewNames)
                    }
                }
            }.navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Button("ChangeInfo"){
                isDate.toggle()
            })
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
