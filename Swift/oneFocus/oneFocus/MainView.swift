//
//  MainView.swift
//  oneFocus
//
//  Created by Samuel Rojas on 8/22/24.
//

import SwiftUI

struct MainView: View {
    @State private var showToDoList = false
    @State private var showPomodoroTimer = false

    var body: some View {
        VStack(spacing: 20) {
            if !showToDoList && !showPomodoroTimer {
                Button(action: {
                    withAnimation(.easeInOut) {
                        showToDoList = true
                    }
                }) {
                    Text("To-Do List")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        showPomodoroTimer = true
                    }
                }) {
                    Text("Pomodoro Timer")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            } else {
                if showToDoList {
                    ToDoListView()
                        .transition(.move(edge: .trailing))
                }
                
                if showPomodoroTimer {
                    PomodoroTimerView()
                        .transition(.move(edge: .trailing))
                }
            }
        }
        .padding()
        .frame(width: 200)
        .background(Color.gray)
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    MainView()
}
