//
//  DateFormatter.swift
//  ExpenseTracker
//
//  Created by Андрей Русин on 06.10.2022.
//

import Foundation
extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat  = "MM/dd/yyyy"
        return formatter
    }()
}
