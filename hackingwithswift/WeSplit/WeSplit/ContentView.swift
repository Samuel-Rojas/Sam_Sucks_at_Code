//
//  ContentView.swift
//  WeSplit
//
//  Created by Samuel Rojas on 7/29/24.
//

import SwiftUI


struct ContentView: View {
    
    @State private var students = ["harry", "jackson", "Charlie"]
    @State private var student = "harry"
    
    var body: some View {
        
        NavigationStack{
            Form{
                Picker("Select you Student", selection: $student){
                    ForEach(students, id: \.self){
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
            
        }
       
        
    }
    
}


#Preview {
    ContentView()
}
