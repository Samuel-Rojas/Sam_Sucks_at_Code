//
//  Journal.swift
//  journalAPI
//
//  Created by Samuel Rojas on 10/28/24.
//

import SwiftUI

class NotionAuthManager: ObservableObject {
    @Published var isAuthenticated = false
    @AppStorage("notionAccessToken") private var accessToken: String = ""
    
    static let shared = NotionAuthManager()
    
    init() {
        isAuthenticated = !accessToken.isEmpty
        
        // Listen for OAuth callback
        NotificationCenter.default.addObserver(
            forName: .notionOAuthCallback,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            guard let url = notification.userInfo?["url"] as? URL else { return }
            self?.handleOAuthCallback(url: url)
        }
    }
    
    func startOAuthFlow() {
        let clientId = "132d872b-594c-8015-8375-0037b75f0f6c"
        let redirectUri = "notionjournal://oauth-callback"
        
        let authURL = """
            https://api.notion.com/v1/oauth/authorize?\
            client_id=\(clientId)&\
            redirect_uri=\(redirectUri)&\
            response_type=code&\
            owner=user
            """
        
        print("Attempting to open URL: \(authURL)")  // Debug print
        
        if let url = URL(string: authURL) {
            NSWorkspace.shared.open(url)
        } else {
            print("Failed to create URL")  // Debug print
        }
    }
    
    private func handleOAuthCallback(url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let code = components.queryItems?.first(where: { $0.name == "code" })?.value
        else { return }
        
        exchangeCodeForToken(code)
    }
    
    private func exchangeCodeForToken(_ code: String) {
        let clientId = "132d872b-594c-8015-8375-0037b75f0f6c"
        let clientSecret = "secret_gDr0b2QTzGOAvnlMcmasZPT8YoTtx7BPsoaF5Aepcn9"
        let redirectUri = "notionjournal://oauth-callback"
        
        // Create URL request
        guard let url = URL(string: "https://api.notion.com/v1/oauth/token") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Create request body
        let body: [String: Any] = [
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": redirectUri,
            "client_id": clientId,
            "client_secret": clientSecret
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        // Make the request
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let accessToken = json["access_token"] as? String
            else { return }
            
            DispatchQueue.main.async {
                self?.accessToken = accessToken
                self?.isAuthenticated = true
            }
        }.resume()
    }
}

struct Journal: View {
    @StateObject private var authManager = NotionAuthManager.shared
    @State private var titleID: String = ""
    @State private var bodyID: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            if authManager.isAuthenticated {
                journalView
            } else {
                connectToNotionView
            }
        }
        .frame(minWidth: 400, minHeight: 500)
    }
    
    private var connectToNotionView: some View {
        VStack(spacing: 20) {
            Text("Connect to Notion")
                .font(.title)
            
            Text("To get started, connect your Notion account")
                .multilineTextAlignment(.center)
            
            Button("Connect with Notion") {
                authManager.startOAuthFlow()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    // ... rest of your Journal view implementation ...
    
    
    private var journalView: some View {
        VStack(spacing: 20) {
            Text("Journal")
                .font(.title)
            
            Text("Write your journal entries here")
                .multilineTextAlignment(.center)
            
            TextField("Title", text: $titleID)
                .padding()
            
            TextEditor(text: $bodyID)
                .padding()
        }
    }
}
