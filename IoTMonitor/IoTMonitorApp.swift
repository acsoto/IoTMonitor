//
//  IoTMonitorApp.swift
//  IoTMonitor
//
//  Created by 周子航 on 2021/11/26.
//

import SwiftUI

@main
struct IoTMonitorApp: App {
    @StateObject private var postManager = PostManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                    .environmentObject(postManager)
        }
    }
}
