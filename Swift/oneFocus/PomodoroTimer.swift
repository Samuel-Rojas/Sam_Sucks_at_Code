//
//  PomodoroTimer.swift
//  oneFocus
//
//  Created by Samuel Rojas on 9/11/24.
//

import SwiftUI

struct PomodoroTimer: View {
    //25 Minutes in Seconds
    @State private var timeRemaining = 1500
    
    //Check wheather time is active
    @State private var timeIsActive = false
    
    //Use the Timer Class
    @State private var timer: Timer? = nil
    
    //Array to store the task
    @State private var tasks = [String]()
    
    //The Task in seconds
    @State private var userTask: String = ""
    
    
    var body: some View {
       
        VStack(spacing: 20){
            
            //Display Time
            Text(timeString(time: timeRemaining))
                .font(.largeTitle)
                .padding()
            
            Button(action:{
                if timeIsActive {
                    pauseTimer()
                } else {
                    startTimer()
                }
            }) {
                Text(timeIsActive ? "Pause" : "Start")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                resetTimer()
            }) {
                Text("Reset")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                
            }
        }
        .padding()
        .frame(width: 200)
        
        VStack(spacing: 20) {
            
            Section{
                TextField("Task for this Flow", text: $userTask)
                
                Button(action: {
                   addTask()
                }) {
                    Text("+")
                }
                
            }
            
            Section{
                ForEach(tasks, id: \.self) { task in
                    HStack {
                        Text(task)
                        Button(action: {
                            //deleteTask()
                        }) {
                            Text("Delete")
                        }
                        
                        Button(action: {
                            //editTask
                        })  {
                            Text("Edit")
                        }
                    }
                }
            }
            .padding()
            
        }
        
    }
    
    func addTask() {
        tasks.append(userTask)
        userTask = ""
    }
    
    func deleteTask() {
        //Finish this function
    }
    
    func editTaks() {
        //Finish this function
    }
    
    func timeString(time: Int) -> String{
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func startTimer() {
        timeIsActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true ) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                resetTimer()
            }
        }
    }
    
    func pauseTimer() {
            timeIsActive = false
            timer?.invalidate()
        }
        
        
        func resetTimer() {
            timeIsActive = false
            timer?.invalidate()
            timeRemaining = 1500 // 25 minutes
        }
}

#Preview {
    PomodoroTimer()
}
