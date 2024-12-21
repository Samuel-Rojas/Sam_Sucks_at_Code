//
//  journalAPIApp.swift
//  journalAPI
//
//  Created by Samuel Rojas on 10/28/24.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow?
    
    func application(_ application: NSApplication, open urls: [URL]) {
        guard let url = urls.first else { return }
        
        // Post notification when URL is received
        NotificationCenter.default.post(
            name: .notionOAuthCallback,
            object: nil,
            userInfo: ["url": url]
        )
    }
}

// Extension to define the notification name
extension Notification.Name {
    static let notionOAuthCallback = Notification.Name("notionOAuthCallback")
}

@main
struct NotionJournalApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            Journal()
        }
    }
}
