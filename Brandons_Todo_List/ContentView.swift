//
//  ContentView.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/5/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    // MARK: Internal

    var body: some View {
        if session.isLoggedIn {
            NavigationPage()
        } else {
            AccountCreationPage()
        }
    }

    // MARK: Private

    @Environment(\.modelContext) private var modelContext
    @State private var isLoggedIn: Bool = false
    @EnvironmentObject private var session: UserSession
}

#Preview {
    ContentView()
}
