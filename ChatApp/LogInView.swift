//
//  LogInView.swift
//  ChatApp
//
//  Created by Long Lam on 1/30/24.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var appState : AppState
    var body: some View {
        Button("Login") {
            appState.hasLogin = true
        }
    }
}

#Preview {
    LogInView()
}
