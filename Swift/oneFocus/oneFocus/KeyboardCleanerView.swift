//
//  KeyboardCleanerView.swift
//  oneFocus
//
//  Created by Samuel Rojas on 8/15/24.
//

import SwiftUI

struct KeyboardCleanerView: View {
    @StateObject private var keyboardManager = KeyboardCleanerManager()

    var body: some View {
        VStack(spacing: 20) {
            Text("Keyboard Cleaner")
                .font(.headline)

            Text(keyboardManager.cleaningEnabled ? "Cleaning Mode Enabled" : "Click to Enable Cleaning Mode")
                .foregroundColor(keyboardManager.cleaningEnabled ? .red : .primary)

            Button(action: {
                toggleCleaningMode()
            }) {
                Text(keyboardManager.cleaningEnabled ? "Disable Cleaning Mode" : "Enable Cleaning Mode")
            }
            .padding()
            .background(keyboardManager.cleaningEnabled ? Color.red : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .frame(width: 300, height: 200)
        .onAppear {
            keyboardManager.startMonitoringKeyboard()
        }
        .onDisappear {
            keyboardManager.stopMonitoringKeyboard()
        }
    }

    private func toggleCleaningMode() {
        keyboardManager.cleaningEnabled.toggle()
    }
}


#Preview {
    KeyboardCleanerView()
}
