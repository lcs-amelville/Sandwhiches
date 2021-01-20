//
//  SandwhichesApp.swift
//  Shared
//
//  Created by Melville, Aidan on 2021-01-20.
//

import SwiftUI

@main
struct SandwhichesApp: App {
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
