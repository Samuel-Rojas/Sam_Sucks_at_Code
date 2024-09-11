//
//  oneFocusApp.swift
//  oneFocus
//
//  Created by Samuel Rojas on 8/14/24.
//

import SwiftUI

@main
struct oneFocusApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        MenuBarExtra {
            MainView()
        } label: {
            Text("oneFocus")
        }.menuBarExtraStyle(.window)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover: NSPopover?
    var currentView: AnyView = AnyView(ToDoListView())
    
    func applicationDidFinishLaunching(_ notification: Notification){
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "person.circle", accessibilityDescription: "oneFocus")
            button.action = #selector(showMenu)
        }
        
        popover = NSPopover()
        popover?.contentSize = NSSize(width: 300, height: 200)
        popover?.behavior = .transient
        popover?.contentViewController = NSHostingController(rootView: currentView)
        
        
    }
    
    @objc func showMenu(){
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "To-Do List", action: #selector(switchToDoList), keyEquivalent: "T"))
        menu.addItem(NSMenuItem(title: "Pomodoro Timer", action: #selector(switchToPomodoro), keyEquivalent: "P"))
        
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit oneFocus", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "Q"))
        
        statusItem?.menu = menu
        statusItem?.button?.performClick(nil)
        
        
    }
    
    
    @objc func togglePopover(){
        // Code to toggle popover screen when icon is pressed
        
        if let button = statusItem?.button {
            if popover?.isShown == true {
                popover?.performClose(nil)
            } else {
                popover?.contentViewController = NSHostingController(rootView: currentView)
                popover?.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
                popover?.contentViewController?.view.window?.becomeKey()
            }
        }
        
    }
    
    @objc func switchToPomodoro(){
        currentView = AnyView(PomodoroTimerView())
        togglePopover()
    }
    
    @objc func switchToDoList(){
        currentView = AnyView(ToDoListView())
        togglePopover()
    }
    

}
