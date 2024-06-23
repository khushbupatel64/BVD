//
//  BVDGroupAppApp.swift
//  BVDGroupApp
//
//  Created by khushbu on 06/06/24.
//

import SwiftUI

@main
struct BVDGroupApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
   
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
