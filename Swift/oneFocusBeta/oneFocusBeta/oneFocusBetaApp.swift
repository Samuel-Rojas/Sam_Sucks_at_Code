//
//  oneFocusBetaApp.swift
//  oneFocusBeta
//
//  Created by Samuel Rojas on 9/5/24.
//

import SwiftUI

@main
struct oneFocusBetaApp: App {
    
    var body: some Scene {
        
        MenuBarExtra{
        //KeyboardCleaner()
        //WallpaperChanger()
        //NoteTaking()
        //Analytics()
            PomodoroTimer()
            
        } label: {
            Image(systemName: "timer")
        }
        .menuBarExtraStyle(.window)
        
    }
}
