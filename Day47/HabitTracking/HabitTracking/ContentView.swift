//
//  ContentView.swift
//  HabitTracking
//
//  Created by Shohei Yamamoto on 2021/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activityList: ActivityList
    @State var isPresentSheet = false
    @State var title: String = ""
    @State var description: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<activityList.activities.count) { i in
                    HStack {
                        NavigationLink(
                            destination: DetailView(activity: $activityList.activities[i]),
                            label: {
                                Text(activityList.activities[i].title)
                            })
//                        NavigationLink(Text(activityList.activities[i].title), destination: {
//                            DetailView(activity: activityList.activities[i])
//                        })
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresentSheet = true
                    }, label: {
                        Image(systemName: "plus.rectangle.on.folder")
                    })
                }
            }
            .sheet(isPresented: $isPresentSheet) {
                Form {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    Button("Save", action: {
                        activityList.activities.append(Activity(title: title, description: description))
                        isPresentSheet = false
                    })
                }
            }
        }
    }
}

struct DetailView: View {
    @Binding var activity: Activity
    
    var body: some View {
        VStack {
            Text(activity.title)
                .font(.title)
            Text(activity.description)
                .font(.caption)
            Text("\(activity.count)")
            Button(action: {
                activity.count += 1
            }, label: {
                Image(systemName: "plus")
                    .font(.title)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(activityList: ActivityList(activities: [Activity(title: "test", description: "desctiption")]))
    }
}
