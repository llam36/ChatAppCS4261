//
//  LogInView.swift
//  ChatApp
//
//  Created by Long Lam on 1/30/24.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var appState : AppState
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        VStack(spacing: 20) {
            Text("ChatApp")
                    .font(.title).bold()
                    .foregroundColor(Color("Red"))
            
            VStack {
                CustomTextField(placeholder: Text("Username"), text: $username)
                    .disableAutocorrection(true)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color("Gray"))
                    .cornerRadius(50)
                    
                CustomTextField(placeholder: Text("Password"), text: $username)
                    .disableAutocorrection(true)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color("Gray"))
                    .cornerRadius(50)
            }
            .frame(maxWidth: 300)
            Button {
                appState.hasLogin = true
            } label: {
                Text("Log in")
                    .bold()
                    .frame(minWidth: 100)
            }
            .padding(8)
            .background(Color("Red"))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    LogInView()
}
