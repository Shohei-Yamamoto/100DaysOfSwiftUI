//
//  ContentView.swift
//  Bookworm
//
//  Created by Shohei Yamamoto on 2021/04/06.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        CoreDataView()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
