//
//  MapViewModel.swift
//  BallWeatherApp
//
//  Created by Tykhon on 03.12.2025.
//

import MapKit
import Foundation


enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 52.52, longitude: 13.4)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
}


final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    //MARK: saveLocation 
    
    private(set) var locations = [Location]()
    var selectedPlace: Location?
//    let savePath = URL.documentsDirectory.appending(path: "savedPlaces") //for iOS 16+
    
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    let savePath = MapViewModel.getDocumentsDirectory().appendingPathComponent("savedPlaces")
    
    override init() {
        do {
            let data = try Data(contentsOf: savePath)
            locations = try JSONDecoder().decode([Location].self, from: data)
        } catch {
            locations = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(locations)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func addLocation(at point: CLLocationCoordinate2D) {
        let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: point.latitude, longitude: point.longitude)
        locations.append(newLocation)
    }
    
    func update(location: Location) {
        guard let selectedPlace = selectedPlace else { return }

        if let index = locations.firstIndex(of: selectedPlace) {
            locations[index] = location
            save()
        }
    }
    
    
    //MARK: currentLocation
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Please turn on your location services")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager .authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            let coordinate = locationManager.location?.coordinate
                ?? MapDetails.startingLocation

            region = MKCoordinateRegion(center: coordinate,
                                        span: MapDetails.defaultSpan)
        @unknown default:
            print("Received unknown authorization status: \(locationManager.authorizationStatus)")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
