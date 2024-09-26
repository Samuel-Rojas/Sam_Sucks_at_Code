//
//  Flow.swift
//  oneFocus
//
//  Created by Samuel Rojas on 9/25/24.
//

import SwiftUI

struct Flow: View {
    
    //25 Minutes in Seconds
    @State private var timeRemaining = 1500
    
    //Check whether time is active
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
        
        VStack {
            
            Text("To-Do")
                .font(.title2)
                .padding(.top, 20)
            
            Section {
                TextField("Task for this Flow", text: $userTask)
                    .frame(width: 200, height: 40)
                    .cornerRadius(8)
                    .padding(.bottom, 10)
                
                Button(action: {
                    withAnimation {
                        addTask()
                    }
                }) {
                    Text("+")
                        .font(.system(size: 24, weight: .bold))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
            }
            .padding()
            
            Section {
                ForEach(Array(tasks.enumerated()), id: \.element) { index, task in
                    HStack {
                        if currentEditIndex == index {
                            // Task is being edited, show TextField
                            TextField("Edit Task", text: $editatedTask)
                                .frame(width: 150, height: 40)
                                .background(Color.white)
                                .cornerRadius(8)
                            
                            Button(action: {
                                withAnimation {
                                    tasks[index] = editatedTask
                                    currentEditIndex = nil // Exit edit mode
                                }
                            }) {
                                Text("Save")
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        } else {
                            // Task is not being edited, show Text view
                            Text(task)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button(action: {
                                withAnimation {
                                    currentEditIndex = index
                                    editatedTask = task // Set the current task to be edited
                                }
                            }) {
                                Text("Edit")
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color.yellow)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                        
                        // Delete button
                        Button(action: {
                            withAnimation {
                                deleteTask(at: index)
                            }
                        }) {
                            Text("X")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.red.opacity(0.6))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .border(Color.gray, width: 0.4)
                    .transition(.move(edge: .trailing)) // Add transition animation
                }
            }
            
        }
        .padding()
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
    
    func timeString(time: Int) -> String {
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
        timeRemaining = times[0]
    }
}

#Preview {
    Flow()
}
