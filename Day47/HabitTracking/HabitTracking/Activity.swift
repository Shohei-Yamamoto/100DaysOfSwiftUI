//
//  Activity.swift
//  HabitTracking
//
//  Created by Shohei Yamamoto on 2021/03/23.
//

import Foundation

class ActivityList: ObservableObject {
    @Published var activities: [Activity]
    
    init(activities: [Activity] = [Activity]()) {
        self.activities = activities
    }
}

struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}
