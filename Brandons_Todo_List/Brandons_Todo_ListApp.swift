//
//  Brandons_Todo_ListApp.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/5/25.
//

import Combine
import FirebaseCore
import SwiftUI
import SwiftData


@main
struct Brandons_Todo_ListApp: App {
    // used to integerate third party applications
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            NoteText.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserSession())
        }
        .modelContainer(sharedModelContainer)
    }
}

/// Used to integrate third party applications
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

/// Contains information about a user
final class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var user: User? = nil
}
