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
    var title: String
    var description: String
    var count: Int
    
    init(title: String, description: String, count: Int = 0) {
        self.title = title
        self.description = description
        self.count = count
    }
}
