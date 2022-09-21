import SwiftUI

@main
struct ios_myinstaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StartScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(SessionStore())
        }
    }
}
