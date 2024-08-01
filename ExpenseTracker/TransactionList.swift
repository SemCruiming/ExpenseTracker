//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Sem Cruiming on 31/07/2024.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                
                //MARK: - Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key) { month,
                transactions in
                    Section {
                        //MARK: - Transaction List
                        ForEach(transactions) { transaction in
                            ZStack {
                                TransactionRow(transaction: transaction)
                                NavigationLink("") {
                                    TransactionView(transaction: transaction)
                                }
                                .opacity(0)
                            }
                        }
                    } header: {
                        //MARK: - Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
        }
        .environmentObject(transactionListVM)
    }
}
