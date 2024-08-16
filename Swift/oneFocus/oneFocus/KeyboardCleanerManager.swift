//
//  KeyboardCleanerManager.swift
//  oneFocus
//
//  Created by Samuel Rojas on 8/15/24.
//

import Cocoa
import SwiftUI

class KeyboardCleanerManager: ObservableObject {
    
    @Published var cleaningEnabled: Bool = false
    private var keyMonitor: Any?
    private var eventTap: CFMachPort?
    
    func startMonitoringKeyboard() {
        keyMonitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) { [weak self] event in
            guard let self = self else { return event }
            print("Key event revieved: \(event)")
            if self.cleaningEnabled {
                print("Cleaning mode enabled - ignoring key event.")
                return nil
            }
            return event
        }
        print("Started monitoring keyboard.")
        
        
        if eventTap == nil {
            let eventMask = (1 << CGEventType.keyDown.rawValue) | (1 << CGEventType.keyUp.rawValue)
            eventTap = CGEvent.tapCreate(tap: .cghidEventTap,
                                         place: .headInsertEventTap,
                                         options: .defaultTap,
                                         eventsOfInterest: CGEventMask(eventMask),
                                         callback: { _, type, event, refcon in
                let manager = Unmanaged<KeyboardCleanerManager>.fromOpaque(refcon!).takeUnretainedValue()
                if manager.cleaningEnabled {
                    print("Global Event Tap: Ignoring event \(event)")
                    return nil
                }
                return Unmanaged.passRetained(event)
            },
                    userInfo: UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))
            
            if let eventTap = eventTap{
                let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
                CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
                CGEvent.tapEnable(tap: eventTap, enable: true)
                print("Started Global Event Tap.")
            } else {
                print("Failed to create Global Event Tap.")
            }
        }
    }

    func stopMonitoringKeyboard() {
        if let keyMonitor = keyMonitor {
            NSEvent.removeMonitor(keyMonitor)
            print("Stopped monitoring keyboard.")
        }
        if let eventTap = eventTap {
            
            CGEvent.tapEnable(tap: eventTap, enable: false)
            
            if let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0){
                CFRunLoopRemoveSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
            }
            
            self.eventTap = nil
            print("Stopped monitoring event tap.")
        }
    }
    
}
