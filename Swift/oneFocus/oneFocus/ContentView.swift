//
//  ContentView.swift
//  oneFocus
//
//  Created by Samuel Rojas on 7/25/24.
//

import SwiftUI


    

struct ContentView: View {
    
    @State private var area: Double = 0.0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Area: \(area)")
        }
        .padding()
        .onAppear{
            calculate(rad: 25)
        }
        
    }
    
    func calculate(rad: Double){
        let pi: Double =  3.14159
        var radius: Double = rad
        var sum: Double = pi * radius * radius
        area = sum
    }
    
}

#Preview {
    ContentView()
}


