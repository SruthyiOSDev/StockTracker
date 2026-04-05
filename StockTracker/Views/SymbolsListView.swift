//
//  SymbolsListView.swift
//  StockTracker
//
//  Created by MACAIR on 05/04/2026.
//

import Foundation
import SwiftUI

struct SymbolsListView: View {
    @StateObject var vm = StockViewModel()
    @StateObject var ws = WebSocketService()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Circle().fill(ws.status == .connected ? .green : .red).frame(width: 10)
                    Text(ws.status == .connected ? "Connected" : "Disconnected")
                }
               
                Button(ws.status == .connected ? "Stop Feed" : "Start Feed") {
                    ws.status == .connected ? ws.disconnect() : ws.connect()
                }
                .buttonStyle(.borderedProminent)

                HStack {
                    Button("Sort by Price") { vm.sortByPrice() }
                    Button("Sort by Change") { vm.sortByChange() }
                }

                List(vm.stocks) { stock in
                    NavigationLink(destination: DetailView(stock: stock)) { 
                        HStack {
                            Text(stock.symbol).bold()
                            Spacer()
                            Text("$\(String(format: "%.2f", stock.price))")
                            Text("\(stock.priceChange > 0 ? "+" : "")\(String(format: "%.2f", stock.priceChange))%")
                                .foregroundColor(stock.priceChange >= 0 ? .green : .red)
                        }
                    }
                }
            }
            .navigationTitle("Stocks")
        }.navigationViewStyle(.stack)
    }
}
