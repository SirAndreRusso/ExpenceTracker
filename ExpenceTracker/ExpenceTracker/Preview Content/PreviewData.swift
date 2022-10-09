//
//  PreviewData.swift
//  ExpenceTracker
//
//  Created by Андрей Русин on 06.10.2022.
//

import Foundation
var transactionPreviewData = Transaction(id: 1, date: "06.10.2022", institution: "Desjardins", account: "VisaDesjardins", merchant: "Apple", amount: 15.5, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)
var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
