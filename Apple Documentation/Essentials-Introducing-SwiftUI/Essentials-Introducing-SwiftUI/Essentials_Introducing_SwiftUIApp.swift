//
//  Essentials_Introducing_SwiftUIApp.swift
//  Essentials-Introducing-SwiftUI
//
//  Created by chamsol kim on 2023/04/23.
//

import SwiftUI

@main
struct Essentials_Introducing_SwiftUIApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
    }
}
