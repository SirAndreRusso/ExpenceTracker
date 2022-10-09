//
//  TransactionListViewModel.swift
//  ExpenceTracker
//
//  Created by Андрей Русин on 08.10.2022.
//

import Foundation
import Combine
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
}
