//
//  KavsoftSwiftUIExampleApp.swift
//  KavsoftSwiftUIExample
//
//  Created by chamsol kim on 2023/06/29.
//

import SwiftUI

@main
struct KavsoftSwiftUIExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            CustomKeyboardExample()
        }
    }
}
