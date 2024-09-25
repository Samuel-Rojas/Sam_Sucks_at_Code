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
    
    //Storing the index of the current index
    @State private var currentEditIndex: Int? = nil
    
    //Update the task
    @State private var editatedTask: String = ""
    
    //Array that contains the amount of times
    @State private var times = [1500, 1800, 2100 , 2700 , 3000, 3600, 5400]
    
    
    var body: some View {
       
        VStack(spacing: 20){
            
            //Display Time
            
            Section{
                Text(timeString(time: timeRemaining))
                    .font(.largeTitle)
                    .padding()
                
                Picker("Select Time Range", selection: $timeRemaining){
                    ForEach(times, id: \.self){ timeRange in
                        Text("\(timeRange / 60) minutes")
                    }
                }
                
                
                
            }
            
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
            .padding()
            
            Section{
                ForEach(Array(tasks.enumerated()), id: \.element) { index, task in
                    HStack {
                        if currentEditIndex == index {
                            // Task is being edited, show TextField
                            TextField("Edit Task", text: $editatedTask)
                            
                            Button(action: {
                                // Save the edited task
                                tasks[index] = editatedTask
                                currentEditIndex = nil // Exit edit mode
                            }) {
                                Text("Save")
                            }
                            .padding()
                        } else {
                            // Task is not being edited, show Text view
                            Text(task)
                            
                            Button(action: {
                                // Enter edit mode
                                currentEditIndex = index
                                editatedTask = task // Set the current task to be edited
                            }) {
                                Text("Edit")
                            }
                            .padding()
                        }
                        
                        // Delete button stays the same
                        Button(action: {
                            deleteTask(at: index)
                        }) {
                            Text("Delete")
                        }
                        .padding()
                    }
                }
                .padding()

            }
            
            
        }
        
    }
    //Function --> Adds task to the to-do list
    func addTask() {
        tasks.append(userTask)
        userTask = ""
    }
    
    //Function --> Deletes task based on the index
    func deleteTask(at index: Int) {
        
        
        tasks.remove(at: index)
        
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
            timeRemaining =  times[0]
        }
}

#Preview {
    PomodoroTimer()
}
