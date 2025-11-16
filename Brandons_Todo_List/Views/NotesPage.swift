//
//  NotesPage.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/11/25.
//

import SwiftUI

struct NotesPage: View {
    @State private var currentText = ""
    @State private var noteItems: [NoteText] = []
    
    var body: some View {
        List(noteItems, id: \.self) { note in
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
                print("Submit button pressed")
                noteItems.append(NoteText(text: currentText))
            }
    }
    
    func addNote(text: String) {
        noteItems.append(NoteText(text: text))
    }
}

#Preview {
    NotesPage()
}

fileprivate struct NoteText: Identifiable, Hashable {
    let id: UUID = UUID()
    var text: String
}
