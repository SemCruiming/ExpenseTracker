//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Sem Cruiming on 30/07/2024.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
   
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
