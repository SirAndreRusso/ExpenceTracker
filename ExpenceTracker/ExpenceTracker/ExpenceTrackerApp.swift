//
//  ExpenceTrackerApp.swift
//  ExpenceTracker
//
//  Created by Андрей Русин on 05.10.2022.
//

import SwiftUI

@main
struct ExpenceTrackerApp: App {
   @StateObject var transactionsListVM  = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionsListVM)
        }
    }
}
