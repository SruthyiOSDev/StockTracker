Stock Tracker App

A robust, real-time stock monitoring application built with SwiftUI and Combine, designed for high performance and scalability.
 Live Price Monitoring: Tracks real-time price updates for 25 stock symbols, ensuring a smooth, scrollable user experience. 
 WebSocket Integration: Connects to wss://ws.postman-echo.com/raw to generate and receive real-time price echoes. 
 Dynamic Sorting: Users can toggle the list view to sort by Current Price or Price Change percentage.  
 Connection Management: Includes a real-time status indicator and a manual toggle to Start or Stop the price feed. 
 Detailed Analytics: A secondary screen providing in-depth descriptions and live price tracking for selected symbols.  
 
 Architecture & Technical Strategy
 
 This project implements advanced iOS architecture patterns to meet "ready-to-launch" standards:
 MVVM + Combine: Utilizes a reactive design pattern where the StockViewModel subscribes to a centralized WebSocketService via Combine, ensuring data consistency across all screens. 
 
 Dependency Injection: Decouples networking logic from the UI, allowing for easier testing and future migrations to production APIs.  
 
 State Management: Uses @EnvironmentObject to synchronize the state between the Symbols List and Symbol Details screens.  
 
 Unit Testing Strategy
 
 The project includes a comprehensive unit testing suite designed for CI (Continuous Integration) automation:

 Business Logic Validation: Focused tests for sorting algorithms and data transformation logic.  
 Mocking: Tests are designed to run independently of the network, ensuring fast and reliable execution.  

