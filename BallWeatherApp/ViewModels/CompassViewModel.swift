//
//  CompassViewModel.swift
//  BallWeatherApp
//
//  Created by Tykhon on 03.12.2025.
//

import CoreLocation
import SwiftUI

final class CompassViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var heading: CGFloat = 0
    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
        manager.startUpdatingHeading()
        manager.requestWhenInUseAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            heading = CGFloat(newHeading.magneticHeading)
        }
    }
}
