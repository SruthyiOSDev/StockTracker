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
                .font(.largeTitle).bold()
            
            Text("$\(String(format: "%.2f", stock.price))")
                .font(.title2)
            
            Text(stock.description)
                .padding()
            
            Spacer()
        }
    }
}
