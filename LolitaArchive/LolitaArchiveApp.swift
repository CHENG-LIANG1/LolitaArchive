//
//  LolitaArchiveApp.swift
//  LolitaArchive
//
//  Created by 梁非凡 on 2025/1/28.
//

import SwiftUI
import MijickNavigationView

@main
struct LolitaArchiveApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .implementNavigationView(config: navigationConfig)
                .environment(\.managedObjectContext, dataController.container.viewContext)

        }
    }
}


private extension LolitaArchiveApp {
    var navigationConfig: NavigationGlobalConfig {
        var config = NavigationGlobalConfig()
        config.backGestureThreshold = 0.25
        return config
    }
}
