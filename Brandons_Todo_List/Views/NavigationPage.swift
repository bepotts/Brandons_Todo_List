//
//  NavigationPage.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/26/25.
//

import SwiftData
import SwiftUI

// MARK: - NavigationPage

struct NavigationPage: View {
    // MARK: Private

    @State private var visibility: NavigationSplitViewVisibility = .automatic
    @State private var selection: AppRoutes = .notes
    @EnvironmentObject var session: UserSession

    // MARK: Internal

    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List {
                NavigationLink(value: AppRoutes.notes) {
                    Label("Notes", systemImage: "square.and.pencil")
                }
                NavigationLink(value: AppRoutes.photos) {
                    Label("Photos", systemImage: "photo")
                }
                NavigationLink(value: AppRoutes.maps) {
                    Label("Maps", systemImage: "map")
                }
                NavigationLink(value: AppRoutes.settings) {
                    Label("Settings", systemImage: "gearshape")
                }
            }
            .navigationTitle("ToDo List")
            .navigationDestination(for: AppRoutes.self) { route in
                switch route {
                case .notes:
                    NotesPage()
                case .photos:
                    PhotosPage()
                case .maps:
                    MapsPage()
                case .settings:
                    SettingsPage()
                }
            }
        } detail: {
            Text("Select an item from the sidebar")
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - AppRoutes

enum AppRoutes: String, Hashable, Identifiable {
    case notes
    case photos
    case maps
    case settings

    // MARK: Internal

    var id: String { rawValue }
}

#Preview {
    NavigationPage()
}
