//
//  NotesPage.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/11/25.
//

import SwiftUI
import SwiftData
import os

struct NotesPage: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \NoteText.lastEdited, order: .reverse) var notes: [NoteText]
    @State private var currentText = ""
    
    var body: some View {
        List(notes) { note in
            @Bindable var note = note
            HStack {
                Image(systemName: "circle.fill")
                    .font(.system(size: 6))  // tiny bullet
                    .padding(.top, 6)        // aligns with text

                Text(note.text)
            }
        }
        TextField("Insert a note", text: $currentText)
            .textFieldStyle(.roundedBorder)
            .padding()
            .onSubmit {
                Logger.notes.info("Submit button pressed")
                addNote(text: currentText)
                currentText = ""
            }
    }
    
    func addNote(text: String) {
        context.insert(NoteText(text: text))
        do {
            try context.save()
            Logger.notes.info("Note saved")
        } catch {
            Logger.notes.error("Error saving note: \(error)")
        }
    }
}

#Preview {
    NotesPage()
}
