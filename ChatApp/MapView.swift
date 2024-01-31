//
//  MapView.swift
//  ChatApp
//
//  Created by Long Lam on 1/30/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var appState : AppState
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
            }
            Button {
                appState.useMap = false
            } label: {
                Text("Stop sharing live location")
                    .bold()
                    .frame(minWidth: 300)
            }
            .padding(8)
            .background(Color("Red"))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    MapView()
}
