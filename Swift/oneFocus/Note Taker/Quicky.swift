//
//  Quicky.swift
//  oneFocus
//
//  Created by Samuel Rojas on 10/13/24.
//

import SwiftUI

struct Quicky: View {
    
    @State private var noteTitleText: String = ""
    @State private var noteText: String = ""
    
    //Animation Variables
    @State private var isTitleTextHovered: Bool = false
    @FocusState private var isTitleTextFocused: Bool
    
    var body: some View {
        
        ScrollView{
            
            VStack{
                //View for Heading
                titleHeading
                
                //View Note Title
                noteTitle
                
                //View for jotting down notes
                noteArea
                
                //View for saving the notes into notion workspace
                saveNotes
                
                //View for auth for notion login
                notionLoginView
            }
        }
    }
    
    private var titleHeading: some View {
        Text("Quicky")
            .font(.system(size: 20, weight: .semibold, design: .rounded)) // Adjusted font size
            .foregroundColor(Color.primary)
            .padding(.top, 15) // Adjusted padding
            .padding(.bottom, 5)
            .padding(.horizontal, 10)
            .multilineTextAlignment(.center)
    }
    
    private var noteTitle: some View {
        HStack{
            TextField("Title..", text: $noteTitleText)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color(NSColor.textBackgroundColor))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
                .frame(width: 230, height: 50)
                .cornerRadius(8)
                .scaleEffect(isTitleTextHovered ? 1.03 : 1.0)
                .onHover { hoveredTitle in
                    withAnimation(.easeIn){
                        isTitleTextHovered = hoveredTitle
                    }
                }
        }
    }
    
    private var noteArea: some View {
        VStack {
            TextEditor(text: $noteText)
                .padding()
                .background(Color(NSColor.textBackgroundColor))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
                .frame(width: 290, height: 150)
                .cornerRadius(8)
        }
        .padding()
    }
    
    private var saveNotes: some View {
        VStack{
            Button(action: {
                guard let accessToken = UserDefaults.standard.string(forKey: "notionAccessToken") else {
                    print("User is not logged in")
                    return
                }
                saveNote(accessToken: accessToken, title: noteTitleText, content: noteText)
                noteTitleText = ""
                noteText = ""
                
            }) {
                Text("Save Note")
                    .font(.subheadline) // Smaller font size
                    .padding(6)
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
                
            }
            .buttonStyle(PlainButtonStyle())
            
            
            Spacer()
        }
    }
    
    private var notionLoginView: some View {
        VStack{
            Button(action: {
                startOAuthFlow()
            }) {
                Text("Login with Notion")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
    
    
    
    func saveNote(accessToken: String, title: String, content: String) {
        
        let url = URL(string: "https://api.notion.com/v1/pages")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("2022-06-28", forHTTPHeaderField: "Notion-Version")
        
        let noteData: [String: Any] = [
            "parent": ["type": "workspace"], // Or you could use a specific database ID if preferred
            "properties": [
                "Title": [
                    "title": [
                        ["text": ["content": title]]
                    ]
                ],
                "Content": [
                    "rich_text": [
                        ["text": ["content": content]]
                    ]
                ]
            ]
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: noteData, options: [])
        } catch {
            print("Failed to serialize request body: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error making request: \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                print("Server returned an error: \(response.statusCode)")
                return
            }
            
            if let data = data {
                print("Successfully saved note to Notion")
            }
        }
        
        task.resume()
    }
    
    
    
    func startOAuthFlow() {
        let clientId = "126d872b-594c-80ea-b1ae-0037bc5635cd"
        let redirectUri = "https://api.notion.com/v1/oauth/authorize?client_id=126d872b-594c-80ea-b1ae-0037bc5635cd&response_type=code&owner=user&redirect_uri=https%3A%2F%2Fonefocus%2F%2Fnotion-auth"
        let notionAuthUrl = "https://api.notion.com/v1/oauth/authorize?client_id=\(clientId)&redirect_uri=\(redirectUri)&response_type=code"
        
        if let url = URL(string: notionAuthUrl) {
            NSWorkspace.shared.open(url)
        }
    }
}

#Preview {
    Quicky()
}
