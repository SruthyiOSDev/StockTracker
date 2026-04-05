//
//  Stock.swift
//  StockTracker
//
//  Created by MACAIR on 05/04/2026.
//

import Foundation
struct Stock: Identifiable, Codable, Equatable {
    let id = UUID()
    let symbol: String
    let name: String
    var price: Double
    var priceChange: Double
    var description: String 
}
