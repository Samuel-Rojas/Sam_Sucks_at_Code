//
//  ContentView.swift
//  WeSplit
//
//  Created by Samuel Rojas on 7/29/24.
//

import SwiftUI


struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [ 10, 15, 20, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection =  Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalCheck: Double {
        let total = Double(checkAmount)
        let totalTip = Double(tipPercentage)
        
        return total + totalTip
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) People")
                        }
                    }
                }
                
                Section ("How much do you want to tip?"){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0..<101){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section ("Amount Per Person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("Total Check"){
                    Text("\(totalCheck)")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused {
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
            
        }
    }
    
}


#Preview {
    ContentView()
}
