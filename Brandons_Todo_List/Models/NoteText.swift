//
//  NoteText.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/16/25.
//

import Foundation
import SwiftData

@Model
class NoteText: Identifiable, Hashable {
    var text: String
    var lastEdited: Date
    
    init(text: String) {
        self.text = text
        self.lastEdited = .now
    }
}
