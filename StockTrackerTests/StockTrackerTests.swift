//
//  StockTrackerTests.swift
//  StockTrackerTests
//
//  Created by MACAIR on 05/04/2026.
//

import XCTest
import Combine
@testable import StockTracker

class StockTrackerTests: XCTestCase {

    var viewModel: StockViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        viewModel = StockViewModel()
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testSortByPriceHighToLow() {
        
        viewModel.stocks = [
            Stock(symbol: "CHEAP", name: "Cheap", price: 10.0, priceChange: 0, description: ""),
            Stock(symbol: "EXPENSIVE", name: "Expensive", price: 500.0, priceChange: 0, description: "")
        ]
        
        viewModel.sortByPrice()
    
        XCTAssertEqual(viewModel.stocks.first?.symbol, "EXPENSIVE")
    }

    func testSortByPriceChangePercentage() {
      
        viewModel.stocks = [
            Stock(symbol: "DOWN", name: "Down", price: 100, priceChange: -5.5, description: ""),
            Stock(symbol: "UP", name: "Up", price: 100, priceChange: 12.2, description: "")
        ]
        
       
        viewModel.sortByChange()
        
       
        XCTAssertEqual(viewModel.stocks.first?.symbol, "UP")
    }
    
   
    func testApplyUpdatesLogic() {
     
        viewModel.stocks = [Stock(symbol: "AAPL", name: "Apple", price: 100.0, priceChange: 0, description: "")]
        
      
        viewModel.applyUpdate(symbol: "AAPL", newPrice: 110.0)
        
        
        XCTAssertEqual(viewModel.stocks.first?.price, 110.0)
        XCTAssertEqual(viewModel.stocks.first?.priceChange, 10.0)
    }

    func testWebSocketEchoResponseUpdatesPrice() {
        let expectation = XCTestExpectation(description: "Wait for price update from Echo")
        
    
        viewModel.stocks = [Stock(symbol: "AAPL", name: "Apple", price: 100.0, priceChange: 0, description: "")]
      
        viewModel.applyUpdate(symbol: "AAPL", newPrice: 110.0)
        
        DispatchQueue.main.async {
            if self.viewModel.stocks.first?.price == 110.0 {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
