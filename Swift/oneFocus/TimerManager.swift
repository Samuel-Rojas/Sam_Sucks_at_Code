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
    @Published var selectedTime: Int = 1500

    var timer: Timer?

    var timeString: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func startTimer() {
        timeRemaining = selectedTime
        isActive = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.resetTimer()
            }
        }
    }

    func pauseTimer() {
        isActive = false
        timer?.invalidate()
    }

    func resetTimer() {
        isActive = false
        timer?.invalidate()
        timeRemaining = selectedTime
    }
}

