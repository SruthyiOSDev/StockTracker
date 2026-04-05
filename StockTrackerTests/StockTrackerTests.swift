//
//  StockTrackerTests.swift
//  StockTrackerTests
//
//  Created by MACAIR on 05/04/2026.
//

import XCTest
@testable import StockTracker

class StockTrackerTests: XCTestCase {

    
    var viewModel: StockViewModel!
    var mockService: WebSocketService!

    override func setUp() {
        super.setUp()
        // We initialize a clean state before every test
        mockService = WebSocketService()
        viewModel = StockViewModel(webSocketService: mockService)
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }

    // Goal: Verify the "Sort by Price" requirement
    func testSortByPriceHighToLow() {
        // 1. Given: A list of stocks with different prices
        viewModel.stocks = [
            Stock(symbol: "CHEAP", name: "Cheap", price: 10.0, priceChange: 0, description: ""),
            Stock(symbol: "EXPENSIVE", name: "Expensive", price: 500.0, priceChange: 0, description: "")
        ]
        
        // 2. When: Sorting by price is triggered
        viewModel.sortByPrice()
        
        // 3. Then: The most expensive stock should be at the top (index 0)
        XCTAssertEqual(viewModel.stocks.first?.symbol, "EXPENSIVE", "Sorting by price failed to put the highest price at the top")
    }

    // Goal: Verify the "Sort by Price Change" requirement
    func testSortByPriceChangePercentage() {
        // 1. Given: Stocks with positive and negative changes
        viewModel.stocks = [
            Stock(symbol: "DOWN", name: "Down", price: 100, priceChange: -5.5, description: ""),
            Stock(symbol: "UP", name: "Up", price: 100, priceChange: 12.2, description: "")
        ]
        
        // 2. When: Sorting by price change
        viewModel.sortByChange()
        
        // 3. Then: The highest positive change should be at the top
        XCTAssertEqual(viewModel.stocks.first?.symbol, "UP", "Sorting by price change failed")
    }
    
    // Goal: Verify real-time data application (Advanced Concept)
    func testApplyUpdatesLogic() {
        // 1. Given: A stock and an incoming websocket update
        let initialPrice = 150.0
        viewModel.stocks = [Stock(symbol: "AAPL", name: "Apple", price: initialPrice, priceChange: 0, description: "")]
        let newPrice = 165.0
        let updates = ["AAPL": newPrice]
        
        // 2. When: The update is applied (using the private helper logic we wrote earlier)
        // Note: In your StockViewModel, ensure 'applyUpdates' is internal or use a public update method
        viewModel.applyUpdates(updates)
        
        // 3. Then: The price should update and change should be calculated (+10%)
        XCTAssertEqual(viewModel.stocks.first?.price, 165.0)
        XCTAssertEqual(viewModel.stocks.first?.priceChange, 10.0)
    }



    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
