import SwiftUI
import CameraView
struct TransactionsView: View {
    let transactions = [
        Transaction(date: Date(), amount: -750.0, description: "Coffee", merchant: "ABC Cafe", category: "Food and Dining"),
        Transaction(date: Date(), amount: -3750.0, description: "Groceries", merchant: "X Mart", category: "Groceries"),
        Transaction(date: Date(), amount: -195.0, description: "Apple One", merchant: "Apple", category: "Entertainment"),
        Transaction(date: Date(), amount: 1200.0, description: "Card Bonus", merchant: "Bank", category: "Rewards"),
        Transaction(date: Date(), amount: -374.25, description: "Book purchase", merchant: "Bookzon", category: "Books and Magazines"),
        Transaction(date: Date(), amount: -2500.0, description: "Dinner", merchant: "Dine In", category: "Food and Dining"),
        Transaction(date: Date(), amount: -3000.0, description: "Fuel", merchant: "DE Fuel", category: "Vehicle"),
        Transaction(date: Date(), amount: 5780.0, description: "Ticket Refund", merchant: "Flight Co.", category: "Travel")
    ]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM ''yy"
        return formatter
    }
    var body: some View {
        VStack {
            CameraView(cameraPosition: .back)
                .blur(radius: 50)
                .mask(
                VStack {
                    HStack {
                        Text("My Transactions")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    ForEach(transactions) { transaction in
                        HStack {
                            Circle()
                                .frame(width: 25, height: 25)
                                .mask(
                                Image(systemName: transaction.amount > 0 ? "arrow.down.forward" : "arrow.up.forward")
                                    .foregroundColor(transaction.amount < 0 ? .red : .green)
                            )

                            VStack(alignment: .leading) {
                                Text(transaction.description)
                                    .font(.title3)
                                    .fontWeight(.semibold)

                                Text("\(dateFormatter.string(from: transaction.date)) • \(transaction.merchant)")
                                    .font(.callout)
                            }
                                .padding(.horizontal)

                            Spacer()

                            Text(String(format: "₹%.2f", abs(transaction.amount)))
                                .foregroundColor(transaction.amount < 0 ? .red : .green)
                        }
                    }
                }
            )
                .padding(.all)
            Spacer()
        }
    }
}
struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
