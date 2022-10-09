import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview ")
                        .font(.title2)
                        .bold()
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationTitle("Navigation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Image(systemName: "bell.badge")
                    .symbolRenderingMode(.palette)
                    .foregroundColor(Color.icon)
            }
            
        }
        .navigationViewStyle(.stack)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        ContentView()
        ContentView()
    }
}
