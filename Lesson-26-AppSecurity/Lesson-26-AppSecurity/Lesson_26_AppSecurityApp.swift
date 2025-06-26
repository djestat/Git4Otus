//
//  Lesson_26_AppSecurityApp.swift
//  Lesson-26-AppSecurity
//
//  Created by Igor on 14.04.2025.
//

import SwiftUI
import SwiftData

@main
struct Lesson_26_AppSecurityApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
        }
        .modelContainer(sharedModelContainer)
    }
}
