//
//  ContentView.swift
//  MyToDoList
//
//  Created by Samuel Rojas on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    var taskList: [String] = []
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

