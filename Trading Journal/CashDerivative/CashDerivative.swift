//
//  CashDerivative.swift
//  Trading Journal
//
//  Created by Dilpreet Singh on 24/01/24.
//  Copyright © 2024 Dilpreet Singh. All rights reserved.
//

import SwiftUI

struct CashDerivative: View {
    
    // MARK: - State Variables
    
    // Selected date and time
    @State  var selectedDate = Date()
    @State  var selectedTime = Date()

    // Symbol and trading type for Before (B) and After (A)
    @State  var CDSymbol: String = ""
    @State var CDB_TradingType: String = ""
    @State  var CDI_TradingType: String = ""
    
    // Buy and sell prices for Before (B) and After (A)
    @State var CDB_BuyPrice: String = ""
    @State var CDI_BuyPrice: String = ""
    @State var CDB_SellPrice: String = ""
    @State var CDI_SellPrice: String = ""
    
    // Stop loss for Before (B) and After (A)
    @State var CDB_StopLoss: String = ""
    @State var CDI_StopLoss: String = ""
    
    // Quantity for Before (B) and After (A)
    @State var CDB_Qty: String = ""
    @State var CDI_Qty: String = ""
    
    // Net profit/loss for Before (B) and After (A)
    @State var CDB_NetProfit: String = ""
    @State var CDI_NetProfit: String = ""
    
    // Notes
    @State var notes: String = ""
    
    // Saved message
    @State var savedMessage: String = ""
    
    // Show saved notes
    @State var showingSavedNotes = false
    
    // MARK: - Formatters
    
    // Date formatter for short date style
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    
    // Time formatter for 24-hour format
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    
                    // MARK: - Date and Time Section
                    
                    Group {
                        // Date picker for selecting a date
                        row(view: AnyView(DatePicker("Date", selection: $selectedDate, in: ...Date(), displayedComponents: .date)))
                        
                        // Time picker for selecting a time
                        Text("Time of Trade")
                            .font(.headline)
                            .padding(.vertical, 5)
                        row(view: AnyView(DatePicker("", selection: $selectedTime, in: ...Date(), displayedComponents: .hourAndMinute)
                            .datePickerStyle(WheelDatePickerStyle())))
                        
                        // Text field for typing the symbol
                        row(view: AnyView(HStack {
                            Text("Symbol")
                                .foregroundColor(.primary)
                                .frame(width: 100, alignment: .leading) // Adjust width as needed
                            TextField("Type symbol of stock here", text: $CDSymbol)
                        }))
                    }
                    
                    // MARK: - Trading Details Section
                    Group {
                        // Horizontal stack for displaying "Before" and "After" labels
                        row(view: AnyView(HStack {
                            Text("List").frame(maxWidth: .infinity, alignment: .center)
                                .background(Color.gray.opacity(0.3)) // Background color
                            
                            Spacer()
                            Spacer()
                            
                            Text("Planning").frame(maxWidth: .infinity, alignment: .center)
                                .background(Color.gray.opacity(0.3)) // Background color
                            Spacer()
                            
                            Text("Implement").frame(maxWidth: .infinity, alignment: .center)
                                .background(Color.gray.opacity(0.3)) // Background color
                            Spacer()
                            
                        }))
                        
                        // Trading type, buy and sell price, stop loss, quantity, and net profit/loss for both Before (B) and After (A)
                        row(view: AnyView(HStack {
                            Text("Type")
                            TextField("Buy/Sell", text: $CDB_TradingType)
                            TextField("Buy/Sell", text: $CDI_TradingType)
                        }))
                        
                        row(view: AnyView(HStack {
                            Text("Buy  ")
                            TextField("Buy Price", text: $CDB_BuyPrice)
                            TextField("Buy Price", text: $CDI_BuyPrice)
                        }))
                        
                        row(view: AnyView(HStack {
                            Text("Sell  ")
                            TextField("Sell Price", text: $CDB_SellPrice)
                            TextField("Sell Price", text: $CDI_SellPrice)
                        }))
                        
                        row(view: AnyView(HStack {
                            Text("SL   ")
                            TextField("Stop Loss", text: $CDB_StopLoss)
                            TextField("Stop Loss", text: $CDI_StopLoss)
                        }))
                        
                        row(view: AnyView(HStack {
                            Text("Qty  ")
                            TextField("Quantity", text: $CDB_Qty)
                            TextField("Quantity", text: $CDI_Qty)
                        }))
                        
                        row(view: AnyView(HStack {
                            Text("Net  ")
                            TextField("Profit/ Loss", text: $CDB_NetProfit)
                            TextField("Profit/ Loss", text: $CDI_NetProfit)
                        }))
                    }
                    
                    
                    // Text editor for notes
                    VStack(alignment: .leading) {
                        Text("Notes:")
                            .font(.headline)
                        TextEditor(text: $notes)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8.0)
                            .frame(minHeight: 100)
                    }
                    
                    // Save button
                    Button("Save") {
                        saveData()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8.0)
                    
                    // Show saved notes button
                    Button("Show Saved Notes") {
                        showingSavedNotes = true
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(8.0)
                    .sheet(isPresented: $showingSavedNotes) {
                        SavedNotesView()
                    }
                    
                    // Display saved message
                    Text(savedMessage)
                        .foregroundColor(.green)
                        .padding()
                }
                .padding()
            }
            .navigationTitle("Cash Derivative")
        }
    }
    
    // MARK: - Row Function
    
    // Custom row function for creating consistent layout
    func row<Content: View>(view: Content) -> some View {
        VStack {
            HStack {
                Spacer()
                view
                Spacer()
            }
            Divider().background(Color.gray)
        }
    }
    
    // MARK: - Save Data Function
    
    func saveData() {
        // Perform the data saving logic here using Swift data storage
        // For demonstration purposes, let's just display a saved message
        savedMessage = "Data Saved!"
    }
}


#Preview {
    CashDerivative()
}
