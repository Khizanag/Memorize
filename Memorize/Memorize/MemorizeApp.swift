//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Giga Khizanishvili on 28.10.21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
