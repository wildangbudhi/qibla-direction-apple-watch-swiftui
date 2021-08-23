//
//  iQiblaApp.swift
//  iQibla WatchKit Extension
//
//  Created by Wildan Ghiffarie Budhi on 23/08/21.
//

import SwiftUI

@main
struct iQiblaApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
