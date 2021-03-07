//
//  AddView.swift
//  iExpense
//
//  Created by Shohei Yamamoto on 2021/03/06.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var isShowingErrorAlert = false
    @State private var errorAlertMessage = ""
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.presentationMode) var presentationMode

    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text:$amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                } else {
                    errorAlertMessage = "You should set number to Amount!"
                    isShowingErrorAlert = true
                }
            })
            .alert(isPresented: $isShowingErrorAlert){
                Alert(title: Text("Warning!"), message: Text(errorAlertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
