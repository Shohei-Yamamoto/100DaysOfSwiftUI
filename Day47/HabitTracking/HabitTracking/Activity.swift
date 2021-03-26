//
//  Activity.swift
//  HabitTracking
//
//  Created by Shohei Yamamoto on 2021/03/23.
//

import Foundation

class ActivityList: ObservableObject {
    @Published var activities: [Activity] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.setValue(encoded ,forKeyPath: "Activity")
            }
        }
    }
    
    init(activities: [Activity] = [Activity]()) {
        if let activities = UserDefaults.standard.data(forKey: "Activity") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Activity].self, from: activities) {
                self.activities = decoded
                return
            }
        }
        self.activities = []
    }
}

struct Activity: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var count: Int
    
    init(title: String, description: String, count: Int = 0) {
        self.title = title
        self.description = description
        self.count = count
    }
    
    
}
