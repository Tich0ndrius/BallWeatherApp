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
    
    var body: some View {
        TabView(selection: $selectedTab){
            //            CompassView()
            //                .tabItem { Label("Compass", systemImage: "barometer")}
            //                .tag(0)
            
            DayCombinedView()
                .tabItem {
                    Label("Weather", systemImage: "sun.max")
                }
                .tag(Tab.tab2)
            
            //            MapView()
            //                .tabItem { Label("Map", systemImage: "map")}
            //                .tag(2)
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


