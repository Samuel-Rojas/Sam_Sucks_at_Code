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
            TextField("Title", text: $noteTitleText)
                .padding()
                .background(Color(NSColor.textBackgroundColor))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 3)
                )
                .frame(width: 260, height: 50)
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
            .border(Color.red, width: 2)
            .background(Color(NSColor.textBackgroundColor))
            .frame(width: 275, height: 150)
        }
        .padding()
    }
    
    private var saveNotes: some View {
        Button(action: {
            saveNote()
        }) {
           Text("Save Note")
        }
        .padding()
    }
    
    
    func saveNote() {
        
    }
}

#Preview {
    Quicky()
}
