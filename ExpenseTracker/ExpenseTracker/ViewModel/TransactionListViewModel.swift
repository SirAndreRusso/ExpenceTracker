//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Андрей Русин on 08.10.2022.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    init() {
        getTransactions()
    }
    func getTransactions() {
       guard let url = URL(string: "https://designcode.io/data/transactions.json")
        else {
           fatalError("Invalid url")
       }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200
                else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    
                case .finished:
                    print("Finished fetching transactions")
                case .failure(let error):
                    print("Error fetching transactions", error.localizedDescription)
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
                dump(self?.transactions)
            }
            .store(in: &cancellables)

    }
    func groupTransactionByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else {return [:]}
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month}
        return groupedTransactions
        }
    func accumulateTransactions() -> TransactionPrefixSum {
        print("accumulate transactions")
        guard !transactions.isEmpty else  {return []}
        let today = "02/17/2022".dateParse() // Date()
        print("today", today)
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval", dateInterval)
        var sum: Double = .zero
        var cumulativeSum = TransactionPrefixSum()
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            let dailyExpenses = transactions.filter { $0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpenses.reduce(0){ $0 - $1.signedAmount }
            sum += dailyTotal
            sum = sum.roundedTo2Digits()
            cumulativeSum.append((date.formatted(), sum))
            print(date.formatted(), "dailyTotal:", dailyTotal, "sum:", sum )
        }
        return cumulativeSum
    }
}
