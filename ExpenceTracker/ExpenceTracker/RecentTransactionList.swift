//
//  RecentTransactionList.swift
//  ExpenceTracker
//
//  Created by Андрей Русин on 09.10.2022.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack {
            HStack {
                // MARK: - Header title
                Text("Recent transactions")
                    .bold()
                Spacer()
                //MARK: - Header link
                NavigationLink {
                    
                } label: {
                    HStack(spacing: 4) {
                        Text("See all")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }

            }
            .padding(.top)
            //MARK: - Recent transactions list
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) {index, transaction in
                TransactionRow(transaction: transaction)
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
    static var transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
}
