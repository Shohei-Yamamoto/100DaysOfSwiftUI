//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Shohei Yamamoto on 2021/04/06.
//

import SwiftUI

@main
struct BookwormApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
