//
//  NoteWorthyApp.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 14.03.2025.
//

import SwiftUI
import SwiftData
import FirebaseCore


@main
struct NoteWorthyApp: App {
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
            MainView()
        }
        .modelContainer(sharedModelContainer)
    }
    init() {
        FirebaseApp.configure()
    }
    
    
    
    
}
