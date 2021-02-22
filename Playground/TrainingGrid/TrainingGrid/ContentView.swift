//
//  ContentView.swift
//  TrainingGrid
//
//  Created by Shohei Yamamoto on 2021/02/21.
//

import SwiftUI
import ElegantCalendar

struct ContentView: View {
    var body: some View {
        // Start & End date should be configured based on your needs.
        let startDate = Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (-30 * 36)))
        let endDate = Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (30 * 36)))

//        LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: 100, maximum: 200)), count: 7), content: {
//            ForEach(0..<100){ num in
//                Rectangle()
//                    .background(Color.blue)
//                    .aspectRatio(1, contentMode: .fit)
//
//            }
//        })
//        .padding(.all, 10)
        ElegantCalendarView(calendarManager: ElegantCalendarManager(
                                configuration: CalendarConfiguration(startDate: startDate,
                                                                     endDate: endDate)))

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
