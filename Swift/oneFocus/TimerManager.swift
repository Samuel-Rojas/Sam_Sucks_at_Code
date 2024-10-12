//
//  TimerManager.swift
//  oneFocus
//
//  Created by Samuel Rojas on 10/11/24.
//

import Foundation
import Combine

class TimerManager: ObservableObject {
    static let shared = TimerManager()

    @Published var timeRemaining: Int = 1500
    @Published var isActive = false
    @Published var selectedTime: Int = 1500 {
        didSet {
            if !isActive && mode == .work{
                timeRemaining = selectedTime
            }
        }
    }
    @Published var selectedBreakTime: Int = 1500 {
        didSet {
            if !isActive && mode == .rest {
                timeRemaining = selectedBreakTime
            }
        }
    }
    
    @Published var mode: TimerMode = .work

    var timer: Timer?

    var timeString: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var modeString: String {
        switch mode {
        case .work:
            return "Work"
        case .rest:
            return "Rest"
        }
    }

    func startTimer() {
        timeRemaining = selectedTime
        if !isActive {
            timeRemaining = mode == .work ? selectedTime : selectedBreakTime
        }
        isActive = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timerEnded()
            }
        }
    }
    
    func timerEnded() {
        if mode == .work {
            mode = .rest
            timeRemaining = selectedBreakTime
        } else {
            mode = .work
            timeRemaining = selectedTime
        }
        startTimer()
    }

    func pauseTimer() {
        isActive = false
        timer?.invalidate()
    }

    func resetTimer() {
        isActive = false
        timer?.invalidate()
        mode = .work
        timeRemaining = selectedTime
    }
    
    enum TimerMode {
        case work
        case rest
    }
}

