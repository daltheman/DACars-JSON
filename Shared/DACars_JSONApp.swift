//
//  DACars_JSONApp.swift
//  Shared
//
//  Created by Danilo Altheman on 11/05/22.
//

import SwiftUI

@main
struct DACars_JSONApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
