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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .implementNavigationView(config: navigationConfig)
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
