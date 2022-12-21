//
//  ContentView.swift
//  iExpense
//
//  Created by Thaddeus Dronski on 12/20/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer ()
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                    showAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddView) {
                AddView(expenses: expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}



////archiving swift objects with codable
//
//struct User: Codable {
//    let firstName: String
//    let lastName: String
//}
//
//struct ContentView: View {
//
//    @State private var user = User(firstName: "Taykor", lastName: "Swift")
//    var body: some View {
//        Button("Save User") {
//            let encoder = JSONEncoder()
//
//            if let data = try? encoder.encode(user) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//        }
//    }
//}


//
//user defaults
//
//struct ContentView: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//    @AppStorage("tapCount") private var tapCount = 0
//
//
//    var body: some View {
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
//        }
//    }
//}







//delete rows
//struct ContentView: View {
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//                Button("Add Number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//            }
//            .toolbar {
//                EditButton()
//            }
//        }
//    }
//
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//}











//showing new views
//struct ContentView: View {
//    @State private var showingSheet = false
//    var body: some View {
//        Button("Show sheet") {
//            //show sheet
//            showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "Thaddyues")
//        }
//    }
//}
//
//struct SecondView: View {
//
//    @Environment(\.dismiss) var dismiss
//
//    let name: String
//
//    var body: some View {
//        Text("Hello, \(name)!")
//        Button("Dismiss") {
//            dismiss()
//        }
//    }
//}





//using classes with content view
//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}
//
//struct ContentView: View {
//   @StateObject var user = User()
//
//    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
//        .padding()
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
