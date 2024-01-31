//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Stephanie Diep on 2022-01-10.
//

import SwiftUI
import Firebase

class AppState: ObservableObject {
    @Published var hasLogin : Bool
    @Published var useMap : Bool
    
    init(hasLogin : Bool, useMap : Bool) {
        self.hasLogin = hasLogin
        self.useMap = useMap
    }
}

@main
struct ChatAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    @ObservedObject var appState = AppState(hasLogin: false, useMap: false)
    var body: some Scene {
        WindowGroup {
            if appState.hasLogin {
                if appState.useMap {
                    MapView()
                        .environmentObject(appState)
                } else {
                    ContentView()
                        .environmentObject(appState)
                }
            } else {
                    LogInView()
                        .environmentObject(appState)
            }
        }
    }
}
