//
//  MapView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 27.11.2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
//    @State private var region = MKCoordinateRegion(
//        center: .init(latitude: 50, longitude: 30),
//        span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)
//    )
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .edgesIgnoringSafeArea(.top)
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkIfLocationServicesEnabled()
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
