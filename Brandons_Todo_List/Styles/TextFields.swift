//
//  TextFields.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/26/25.
//

import SwiftUI

extension View {
    func roundedTextView() -> some View {
        modifier(RoundedTextView())
    }
}

// MARK: - RoundedTextView

struct RoundedTextView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(8.0)
            .padding(12)
            .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    PreviewView()
}

// MARK: - PreviewView

private struct PreviewView: View {
    // MARK: Internal

    var body: some View {
        TextField("First Name", text: $firstName).roundedTextView()
    }

    // MARK: Private

    @State private var firstName: String = ""
}
