//
//  ContentView.swift
//  Animations
//
//  Created by Samuel Rojas on 8/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amountAnimating = 1.0
    
    var body: some View {
        
        Spacer()
       
        Stepper("Scale Amount", value: $amountAnimating.animation(
            
            .easeOut(duration: 1.0)
            .repeatCount(3, autoreverses: true)
            
        ), in: 1...10)
        
        Spacer()
        
        Button("Tap me"){
            amountAnimating += 1
        }
        .padding(40)
        .background(.blue)
        .foregroundStyle(.white)
        .clipShape(Circle())
        .scaleEffect(amountAnimating)
        
    }
}

#Preview {
    ContentView()
}
