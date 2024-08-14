//
//  oneFocusApp.swift
//  oneFocus
//
//  Created by Samuel Rojas on 8/14/24.
//

import SwiftUI

@main
struct oneFocusApp: App {
    
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppState: ObservableObject {
    
}
