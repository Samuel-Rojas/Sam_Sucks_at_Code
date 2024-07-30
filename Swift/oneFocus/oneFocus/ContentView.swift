//
//  ContentView.swift
//  oneFocus
//
//  Created by Samuel Rojas on 7/25/24.
//

import SwiftUI
import AVFoundation

    

struct ContentView: View {
    
    //Tracks the intial time in seconds or remaining time
    @State private var timeRemaining = 25 * 60
    @State private var isRunning = false
    @State private var timer: Timer? = nil
    
    private var audioPlayer: AVAudioPlayer!
    
    
    var body: some View {
        VStack {
            Text("Time Remaining: \(timeRemaining / 60) : \(timeRemaining % 60)")
            
            Button("Start"){
                if !isRunning{
                    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
                    {timer in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        } else{
                            timer.invalidate()
                            isRunning = false
                        }
                    }
                    self.timer = timer
                    isRunning = true
                }
            }
            
            Button("Stop"){
                if isRunning{
                    timer?.invalidate()
                    isRunning = false
                    timer = nil
                }
            }
            
        }
        .onAppear(){
            let soundURL = Bundle.main.url(forResource: "timer_end", withExtension: "mp3")!
            DispatchQueue.main.async {
                /*
                 DOES NOT WORK(BUG)
                 elf.audioPlayer = try! AVAudioPlayer(contentsOf: soundURL)
                 */
                
            }
                
            
        }
        .onDisappear(){
            timer?.invalidate()
        }
        .padding()
        
        
    }
    
    func playSound() {
        audioPlayer.play()
    }
    
    
}

#Preview {
    ContentView()
}


