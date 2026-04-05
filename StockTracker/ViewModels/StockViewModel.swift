//
//  StockViewModel.swift
//  StockTracker
//
//  Created by MACAIR on 05/04/2026.
//

import Foundation

class StockViewModel: ObservableObject {
    @Published var stocks: [Stock] = [
        Stock(symbol: "AAPL", name: "Apple Inc.", price: 175.20, priceChange: 1.2, description: "Consumer electronics, software, and online services."),
        Stock(symbol: "NVDA", name: "NVIDIA Corp.", price: 880.50, priceChange: 5.4, description: "Leader in artificial intelligence computing and GPUs."),
        Stock(symbol: "GOOGL", name: "Alphabet Inc.", price: 152.30, priceChange: -0.5, description: "Specializes in search, advertising, and cloud computing."),
        Stock(symbol: "MSFT", name: "Microsoft Corp.", price: 415.10, priceChange: 0.8, description: "Global leader in software, services, and cloud solutions."),
        Stock(symbol: "AMZN", name: "Amazon.com Inc.", price: 180.40, priceChange: 2.1, description: "E-commerce, cloud computing, and digital streaming."),
        Stock(symbol: "TSLA", name: "Tesla, Inc.", price: 170.10, priceChange: -3.2, description: "Electric vehicles and clean energy solutions."),
        Stock(symbol: "META", name: "Meta Platforms", price: 490.20, priceChange: 1.5, description: "Social technology and metaverse development."),
        Stock(symbol: "BRK.B", name: "Berkshire Hathaway", price: 405.30, priceChange: 0.2, description: "Diversified holding company led by Warren Buffett."),
        Stock(symbol: "V", name: "Visa Inc.", price: 280.15, priceChange: 0.4, description: "Global digital payment services and technology."),
        Stock(symbol: "JPM", name: "JPMorgan Chase", price: 195.60, priceChange: 1.1, description: "Major global financial services provider."),
        Stock(symbol: "UNH", name: "UnitedHealth Group", price: 460.80, priceChange: -0.9, description: "Health care products and insurance services."),
        Stock(symbol: "MA", name: "Mastercard Inc.", price: 475.20, priceChange: 0.3, description: "Global payment processing and financial technology."),
        Stock(symbol: "WMT", name: "Walmart Inc.", price: 60.10, priceChange: 0.1, description: "Multinational retail corporation and grocery stores."),
        Stock(symbol: "LLY", name: "Eli Lilly and Co.", price: 760.30, priceChange: 2.8, description: "Pharmaceutical research and manufacturing."),
        Stock(symbol: "AVGO", name: "Broadcom Inc.", price: 1350.40, priceChange: 4.2, description: "Semiconductor and infrastructure software solutions."),
        Stock(symbol: "HD", name: "Home Depot Inc.", price: 345.50, priceChange: -1.4, description: "Home improvement and construction retail."),
        Stock(symbol: "PG", name: "Procter & Gamble", price: 160.20, priceChange: 0.5, description: "Consumer goods giant across multiple categories."),
        Stock(symbol: "COST", name: "Costco Wholesale", price: 710.10, priceChange: 1.6, description: "Membership-only warehouse club retail."),
        Stock(symbol: "ORCL", name: "Oracle Corp.", price: 125.40, priceChange: -0.7, description: "Cloud applications and platform services."),
        Stock(symbol: "NFLX", name: "Netflix, Inc.", price: 620.30, priceChange: 2.5, description: "Subscription-based streaming service and production."),
        Stock(symbol: "ADBE", name: "Adobe Inc.", price: 485.60, priceChange: -2.1, description: "Digital media and creative software solutions."),
        Stock(symbol: "AMD", name: "Advanced Micro Devices", price: 170.80, priceChange: 3.4, description: "Semiconductors for business and consumer markets."),
        Stock(symbol: "CRM", name: "Salesforce, Inc.", price: 300.20, priceChange: 1.2, description: "Cloud-based customer relationship management."),
        Stock(symbol: "PEP", name: "PepsiCo, Inc.", price: 172.50, priceChange: -0.3, description: "Global food, snack, and beverage corporation."),
        Stock(symbol: "TMO", name: "Thermo Fisher", price: 580.40, priceChange: 0.9, description: "Scientific instruments, software, and services.")
    ]
    
    func sortByPrice() {
        stocks.sort { $0.price > $1.price }
    }
    
    func sortByChange() {
        stocks.sort { $0.priceChange > $1.priceChange } 
    }
}
