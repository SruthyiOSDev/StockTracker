//
//  WebSocketService.swift
//  StockTracker
//
//  Created by MACAIR on 05/04/2026.
//

import Foundation
import Foundation
import Combine

enum ConnectionStatus {
    case connected, disconnected 
}

class WebSocketService: ObservableObject {
    @Published var status: ConnectionStatus = .disconnected
    @Published var latestUpdate: [String: Double] = [:]
    
    private var webSocketTask: URLSessionWebSocketTask?
    private let url = URL(string: "wss://ws.postman-echo.com/raw")!
    private var timer: Timer?

    func connect() {
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.resume()
        status = .connected
        receiveMessage()
        startMockingPrices()
    }

    func disconnect() {
        timer?.invalidate()
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        status = .disconnected
    }

    private func startMockingPrices() {
        // Generates random updates to echo back
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            let randomPrice = Double.random(in: 100...150)
            let message = URLSessionWebSocketTask.Message.string("{\"AAPL\": \(randomPrice)}")
            self.webSocketTask?.send(message) { _ in }
        }
    }
    private func sendPing() {
        webSocketTask?.sendPing { error in
            if let error = error {
                print("Ping failed: \(error)")
            }
        }
    }
    private func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                if case .string(let text) = message {
                    // 1. Convert the string back to Data
                    if let data = text.data(using: .utf8),
                       let decoded = try? JSONSerialization.jsonObject(with: data) as? [String: Double] {
                        
                        // 2. Switch to the Main Thread to update the UI
                        DispatchQueue.main.async {
                            self?.latestUpdate = decoded
                        }
                    }
                }
                // 3. Keep listening for the next message
                self?.receiveMessage()
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.status = .disconnected
                    print("Connection lost: \(error)")
                }
            }
        }
    }
}
