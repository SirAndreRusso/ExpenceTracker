//
//  Date.swift
//  ExpenseTracker
//
//  Created by Андрей Русин on 10.10.2022.
//

import Foundation
extension Date {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}
