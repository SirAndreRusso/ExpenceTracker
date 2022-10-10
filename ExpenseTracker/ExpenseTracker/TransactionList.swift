//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Андрей Русин on 09.10.2022.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack{
            List {
                //MARK: - Transaction group
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key) {month, transactions in
                    Section {
                        //MARK: - Transaction list
                        ForEach(transactions) {transaction in
                            TransactionRow(transaction: transaction)
                            
                        }
                    } header: {
                        //MARK: - Transaction month
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
    static var transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group{
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
