//
//  ContentView.swift
//  time_Converter
//
//  Created by Samuel Rojas on 8/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = 0
    @State private var unit = "Hours"

    let inputUnit = ["Seconds", "Minutes", "Hours", "Days"]
    let outputUnit = ["Sec", "Mins", "Hr", "Dy"]
    
 
    func computedValue(value: Double, inputUnit: String, outputUnit: String) throws -> Double {
            let conversionFactors: [String: Double] = [
                "Seconds": 1.0,
                "Minutes": 60.0,
                "Hours": 3600.0,
                "Days": 86400.0
            ]
            
            guard let inputFactor = conversionFactors[inputUnit],
                  let outputFactor = conversionFactors[outputUnit] else {
                throw ConversionError.invalidUnit
            }
            
            // Perform the actual conversion
            let convertedValue = value * inputFactor / outputFactor
            return convertedValue
        }
    
    var outputText: String {
            do {
                let convertedValue = try computedValue(value: inputValue, inputUnit: unit, outputUnit: outputUnit)
                return "\(convertedValue, specifier: "%.2f") \(outputUnit)"
            } catch ConversionError.invalidUnit {
                return "Invalid unit"
            } catch {
                return "An error occurred"
            }
        }
    
    var body: some View {
        HStack{
            Form{
                Section ("Enter Desired Value:"){
                    TextField("Enter Value", value: $inputValue, format: .number)
                }
                
                Section("Current:"){
                    Picker("Enter Current Unit", selection: $unit){
                        ForEach(inputUnit, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section("Convert to:"){
                    Picker("Enter Desired Unit", selection: $unit){
                        ForEach(outputUnit, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section("Output Value"){
                    Text("Computed Value Goes here")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
