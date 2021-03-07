//
//  ContentView.swift
//  iExpense
//
//  Created by Shohei Yamamoto on 2021/03/03.
//

import SwiftUI


struct ExpenseItem: Identifiable, Codable  {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try?  encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.id) {item in
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text("$\(item.amount)")
                            .foregroundColor(colorFromAmount(item.amount))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                    Button(action: {
                                        self.showingAddExpense = true
                                    }, label: {
                                        Image(systemName: "plus")
                                    })
            )
            
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: self.expenses)
            })
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func colorFromAmount(_ amount: Int) -> Color {
        switch(amount) {
        case ..<10:
            return .gray
        case ..<100:
            return .black
        case 100...:
            return .red
        default:
            fatalError("unexpected amount")
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
