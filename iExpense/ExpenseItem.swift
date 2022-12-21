//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Thaddeus Dronski on 12/21/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
