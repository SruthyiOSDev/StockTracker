//
//  DetailView.swift
//  StockTracker
//
//  Created by MACAIR on 05/04/2026.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let stock: Stock
    
    var body: some View {
        VStack(spacing: 20) {
            Text(stock.symbol)
                .font(.largeTitle).bold() // [cite: 19]
            
            Text("$\(String(format: "%.2f", stock.price))")
                .font(.title2) // [cite: 20]
            
            Text(stock.description) // [cite: 21]
                .padding()
            
            Spacer()
        }
    }
}
