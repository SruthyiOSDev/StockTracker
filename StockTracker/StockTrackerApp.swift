//
//  StockTrackerApp.swift
//  StockTracker
//
//  Created by MACAIR on 05/04/2026.
//

import SwiftUI

@main
struct StockTrackerApp: App {
   
    @StateObject private var webSocketService = WebSocketService()
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
