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
    
    var body: some View {
        
        //View for Heading
        titleHeading
        
        //View Note Title
        noteTitle
        
        //View for jotting down notes
        noteArea
        
        //View for saving the notes into notion workspace
        saveNotes
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
        TextField("Enter Title", text: $noteTitleText)
            .padding()
            .multilineTextAlignment(.center)
    }
    
    private var noteArea: some View {
        TextEditor(text: $noteText)
            .padding()
            .background(Color.green)
            .border(Color.black, width: 1)
            
    }
    
    private var saveNotes: some View {
        Button(action: {
            
        }) {
           Text("Save Note")
        }
    }
}

#Preview {
    Quicky()
}
