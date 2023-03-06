import SwiftUI
import CameraView
struct ContentView: View {
    var body: some View {
        HomeView()
            .background(Color.primary.opacity(0.1))
            .cornerRadius(10)
            .ignoresSafeArea(.all)
    }
}
struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                Text("HDFC Bank")
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "wifi")
                    .rotationEffect(.degrees(90))
            }
                .padding(.all)
            HStack {
                Text("Ishaan Bedi")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
                .padding(.all)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("08/25")
                    Text("Credit Card")
                }
                Spacer()
                Text("••••9740")

            }
                .padding(.all)
        }
            .padding(.all)
    }
}
struct HomeView: View {
    @State private var showTransactionsSheet = false
    var body: some View {
        VStack {
            ZStack {
                CameraView(cameraPosition: .back)
                    .blur(radius: 50)
                    .mask(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .padding(.horizontal)
                    }
                        .frame(height: 220)
                )
                CardView()
            }
            VStack {
                Image(systemName: "chevron.up")
                    .foregroundColor(.white)
                    .font(.title)
                Text("My Transactions")
                    .padding(.top)
            }
                .padding(.bottom, 50)
                .gesture(DragGesture()
                    .onEnded({ value in
                    self.showTransactionsSheet.toggle()
                }))
        }
            .sheet(isPresented: $showTransactionsSheet) {
            TransactionsView()
        }
    }
}
class Transaction: Identifiable {
    let id = UUID()
    let date: Date
    let amount: Double
    let description: String
    let merchant: String
    let category: String

    init(date: Date, amount: Double, description: String, merchant: String, category: String) {
        self.date = date
        self.amount = amount
        self.description = description
        self.merchant = merchant
        self.category = category
    }
}
