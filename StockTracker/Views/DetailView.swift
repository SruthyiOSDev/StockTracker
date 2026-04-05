//
//  DetailView.swift
//  StockTracker
//
//  Created by MACAIR on 05/04/2026.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @EnvironmentObject var vm: StockViewModel
    let symbol: String
    
    var stock: Stock? {
        vm.stocks.first(where: { $0.symbol == symbol })
    }
    
    var body: some View {
        Group {
            if let stock = stock {
                VStack(spacing: 20) {
                    Text(stock.symbol).font(.largeTitle).bold()
                    Text("$\(String(format: "%.2f", stock.price))").font(.title2)
                
                    Text("\(stock.priceChange >= 0 ? "+" : "")\(String(format: "%.2f", stock.priceChange))%")
                        .foregroundColor(stock.priceChange >= 0 ? .green : .red)
                    
                    Text(stock.description).padding()
                    Spacer()
                }
            } else {
                Text("Stock not found")
            }
        }
    }
}
