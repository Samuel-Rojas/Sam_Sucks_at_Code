//
//  AppDelegate.swift
//  oneFocus
//
//  Created by Samuel Rojas on 10/11/24.
//
import Cocoa
import SwiftUI
import Combine

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var popover: NSPopover!
    var cancellables = Set<AnyCancellable>()

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create the status bar item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem.button?.title = "Flow"

        // Observe changes to the timerManager's timeString
        TimerManager.shared.$timeRemaining
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.updateStatusItemTitle()
            }
            .store(in: &cancellables)

        TimerManager.shared.$isActive
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.updateStatusItemTitle()
            }
            .store(in: &cancellables)

        // Create the popover content
        let contentView = Flow()
        popover = NSPopover()
        popover.contentViewController = NSHostingController(rootView: contentView)

        // Set up the status bar button action
        if let button = statusItem.button {
            button.action = #selector(togglePopover(_:))
            button.target = self
        }
    }

    func updateStatusItemTitle() {
        if TimerManager.shared.isActive {
            statusItem.button?.title = TimerManager.shared.timeString
        } else {
            statusItem.button?.title = "oneFocus"
        }
    }

    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = statusItem.button {
            if popover.isShown {
                popover.performClose(sender)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
                popover.contentViewController?.view.window?.becomeKey()
            }
        }
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false // Keep the app running after closing the window
    }
}

