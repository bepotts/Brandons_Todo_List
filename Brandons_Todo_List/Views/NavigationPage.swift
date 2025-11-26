//
//  NavigationPage.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/26/25.
//

import SwiftUI
import SwiftData

struct NavigationPage: View {
    @State private var visibility: NavigationSplitViewVisibility = .automatic
    @State private var selection: String? = "notes"
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                NavigationLink(value: "notes") {
                    Label("Notes", systemImage: "square.and.pencil")
                }
                NavigationLink(value: "photos") {
                    Label("Photos", systemImage: "photo")
                }
                NavigationLink(value: "maps") {
                    Label("Maps", systemImage: "map")
                }
                NavigationLink(value: "settings") {
                    Label("Settings", systemImage: "gearshape")
                }
            }
            .navigationTitle("ToDo List")
        } detail: {
            switch selection {
            case "notes":
                NotesPage()
            case "photos":
                PhotosPage()
            case "maps":
                MapsPage()
            case "settings":
                SettingsPage()
            default:
                Text("Select an item")
            }
        }
    }
}

#Preview {
    NavigationPage()
}
