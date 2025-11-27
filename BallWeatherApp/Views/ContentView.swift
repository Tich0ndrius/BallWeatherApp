//
//  ContentView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 25.11.2025.
//

import SwiftUI

struct ContentView: View {
    enum Tab: Hashable {
        case tab1
        case tab2
        case tab3
    }
    
    @State private var selectedTab: Tab = .tab2
    @State private var selectedCity = sampleCities[0]
    
    var body: some View {
        TabView(selection: $selectedTab){
            
            CompassView()
                .tabItem { Label("Compass", systemImage: "barometer")}
                .tag(Tab.tab1)
            
            DayCombinedView(selectedCity: $selectedCity, cities: sampleCities)
                .tabItem {
                    Label("Weather", systemImage: "sun.max")
                }
                .tag(Tab.tab2)
            
            MapView()
                .tabItem { Label("Map", systemImage: "map")}
                .tag(Tab.tab3)
        }
//        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var selectedCity = sampleCities[0]
    
    static var previews: some View {
        ContentView()
    }
}


