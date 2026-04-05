import SwiftUI

struct SymbolsListView: View {
    @EnvironmentObject var vm: StockViewModel
    @EnvironmentObject var ws: WebSocketService
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Circle()
                        .fill(ws.status == .connected ? Color.green : Color.red)
                        .frame(width: 10, height: 10)
                    Text(ws.status == .connected ? "Connected" : "Disconnected")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.top)
                
                Button(action: {
                    ws.status == .connected ? ws.disconnect() : ws.connect()
                }) {
                    Text(ws.status == .connected ? "Stop Price Feed" : "Start Price Feed")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)

                HStack(spacing: 20) {
                    Button("Sort by Price") { vm.sortByPrice() }
                    Button("Sort by Change") { vm.sortByChange() }
                }
                .padding(.vertical, 5)
                List(vm.stocks) { stock in
                    NavigationLink(destination: DetailView(symbol: stock.symbol)) {
                        StockRow(stock: stock)
                    }
                }
            }
            .navigationTitle("StockTracker")
        }
        .navigationViewStyle(.stack)
    }
}

struct StockRow: View {
    let stock: Stock
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol).bold()
                Text(stock.name).font(.caption).foregroundColor(.secondary)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("$\(String(format: "%.2f", stock.price))")
                    .fontWeight(.semibold)
                Text("\(stock.priceChange >= 0 ? "+" : "")\(String(format: "%.2f", stock.priceChange))%")
                    .font(.caption)
                    .foregroundColor(stock.priceChange >= 0 ? .green : .red)
            }
        }
    }
}
