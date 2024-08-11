//
//  ContentView.swift
//  BetterRest
//
//  Created by Samuel Rojas on 8/7/24.
//
import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var wakeUp = defaultTime
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    
    static var defaultTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Wake Time"){
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .font(.headline)
                }
                
                Section("Desired Sleep"){
                    Text("Enter Desired Sleep Hours")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                Section("Coffee Consumption"){
                    Text("Daily Coffee Intake")
                        .font(.headline)
                    
                    Picker("Coffee Intake", selection: $coffeeAmount){
                        ForEach(0..<21){
                            Text("^[\($0) cup](inflect: true)")
                        }
                    }
                    
                }
                
                Section("Result"){
                    Text("Bedtime: \(alertMessage)")
                }
            }
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Calculate", action: calculateBedTime)
            }
            
        }
        
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is.."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        
    }
    
}

#Preview {
    ContentView()
}
