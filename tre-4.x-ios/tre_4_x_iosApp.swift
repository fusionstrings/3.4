//
//  tre_4_x_iosApp.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-24.
//

import SwiftUI
import SwiftData

@main
struct tre_4_x_iosApp: App {
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
