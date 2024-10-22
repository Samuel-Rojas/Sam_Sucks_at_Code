//
//  oneFocusApp.swift
//  oneFocus
//
//  Created by Samuel Rojas on 9/11/24.
//

import SwiftUI

@main
struct OneFocusApp: App {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        
//        MenuBarExtra{
//            Quicky()
//        } label: {
//            Text("Quicky")
//        }
//        .menuBarExtraStyle(.window)
        
        Settings{
            EmptyView()
        }
    }
}


