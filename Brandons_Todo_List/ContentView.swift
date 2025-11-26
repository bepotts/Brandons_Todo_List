//
//  ContentView.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/5/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isLoggedIn: Bool = false

    var body: some View {
        if isLoggedIn {
            NavigationPage()
        } else {
            AccountCreationPage()
        }
    }
}

#Preview {
    ContentView()
}
