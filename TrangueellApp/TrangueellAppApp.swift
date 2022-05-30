//
//  TrangueellAppApp.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 10/05/22.
//

import SwiftUI

@main
struct TrangueellAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(.dark).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
