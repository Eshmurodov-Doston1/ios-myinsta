//
//  ios_myinstaApp.swift
//  ios-myinsta
//
//  Created by macbro on 21/09/22.
//

import SwiftUI

@main
struct ios_myinstaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StartScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
