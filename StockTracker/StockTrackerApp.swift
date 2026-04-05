//
//  StockTrackerApp.swift
//  StockTracker
//
//  Created by MACAIR on 05/04/2026.
//

import SwiftUI

@main
struct StockTrackerApp: App {
    // 1. Initialize the service first
    @StateObject private var webSocketService = WebSocketService()
    
    // 2. Initialize the ViewModel and pass the service into it
    @StateObject private var stockViewModel: StockViewModel

    init() {
        let service = WebSocketService()
        _webSocketService = StateObject(wrappedValue: service)
        _stockViewModel = StateObject(wrappedValue: StockViewModel(webSocketService: service))
    }

    var body: some Scene {
        WindowGroup {
            SymbolsListView()
                .environmentObject(webSocketService)
                .environmentObject(stockViewModel)
        }
    }
}
