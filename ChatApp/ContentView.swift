//
//  ContentView.swift
//  ChatApp
//
//  Created by Stephanie Diep on 2022-01-10.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    @EnvironmentObject var appState : AppState
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                    .padding(10)
                    .frame(maxHeight: 60)
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 30)
                    .background(.black)
                    .cornerRadius(0, corners: [.topLeft, .topRight]) // Custom cornerRadius modifier added in Extensions file
                    .onChange(of: messagesManager.lastMessageId) { id in
                        // When the lastMessageId changes, scroll to the bottom of the conversation
                        withAnimation {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color("Red"))
            
            MessageField()
                .environmentObject(messagesManager)
                .frame(maxHeight: 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
