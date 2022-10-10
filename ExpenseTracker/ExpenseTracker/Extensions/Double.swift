//
//  Double.swift
//  ExpenseTracker
//
//  Created by Андрей Русин on 10.10.2022.
//

import Foundation
extension Double {
    func roundedTo2Digits() -> Double {
        return (self * 100).rounded() / 100
    }
}
