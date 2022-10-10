//
//  String.swift
//  ExpenseTracker
//
//  Created by Андрей Русин on 06.10.2022.
//

import Foundation
extension String {
    func dateParse () -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        return parsedDate
    }
}
