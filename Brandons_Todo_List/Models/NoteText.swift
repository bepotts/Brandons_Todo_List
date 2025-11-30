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
    // MARK: Lifecycle

    init(text: String) {
        self.text = text
        lastEdited = .now
    }

    // MARK: Internal

    var text: String
    var lastEdited: Date
}
