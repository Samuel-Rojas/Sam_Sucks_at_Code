//
//  PomodoroTimerView.swift
//  oneFocus
//
//  Created by Samuel Rojas on 8/15/24.
//

import SwiftUI

struct PomodoroTimerView: View {
    
    @State private var timeRemaining: Int = 1500
    @State private var timerRunning: Bool = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        
        VStack(spacing: 20){
            Text("Pomodoro Timer")
                .font(.headline)
            
            Text(timeString(from: timeRemaining))
                .font(.system(size: 48, weight: .bold, design: .monospaced))
            
            HStack{
                Button(action: {
                    startTimer()
                }) {
                    Text("Start")
                }
                .disabled(timerRunning)
                
                Button(action: {
                    pauseTimer()
                }) {
                    Text("Pause")
                }
                .disabled(!timerRunning)
                
                Button(action: {
                    resetTimer()
                }) {
                    Text("Reset")
                }
            }
        }
        .padding()
        .frame(width: 300, height: 200)
        
    }
    
    func timeString(from seconds: Int) -> String {
        
        let minutes = seconds / 60
        let seconds = seconds % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
        
    }
    
    func startTimer(){
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                timerRunning = false
                //TODO: Add Notification for when time finishes
            }
        }
    }
    
    func pauseTimer(){
        timerRunning = false
        timer?.invalidate()
    }
    
    func resetTimer(){
        timerRunning = false
        timer?.invalidate()
        timeRemaining = 1500
    }
}

#Preview {
    PomodoroTimerView()
}
