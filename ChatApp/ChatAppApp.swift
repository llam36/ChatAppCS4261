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
    
    init(hasLogin : Bool) {
        self.hasLogin = hasLogin
    }
}

@main
struct ChatAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    @ObservedObject var appState = AppState(hasLogin: false)
    var body: some Scene {
        WindowGroup {
            if appState.hasLogin {
                ContentView()
                    .environmentObject(appState)
            } else {
                LogInView()
                    .environmentObject(appState)
            }
        }
    }
}
