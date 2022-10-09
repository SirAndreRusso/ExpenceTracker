//
//  DateFormatter.swift
//  ExpenceTracker
//
//  Created by Андрей Русин on 06.10.2022.
//

import Foundation
extension DateFormatter {
    static let allNumericRus    : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat  = "dd/mm/yyyy"
        return formatter
    }()
}
