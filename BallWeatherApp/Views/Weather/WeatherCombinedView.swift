//
//  DayCombinedView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 27.11.2025.
//

import SwiftUI

struct WeatherCombinedView: View {
    
    @State private var selectedCity = sampleCities[0]
    let cities: [City]
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.mint, .blue]),
                           startPoint:.topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.top)
            
            VStack{
                CityPickerView(cities: cities, selectedCity: $selectedCity)
                //is there a better method?
                if let today = selectedCity.forecast.first {
                    TodaysView(day: today)
                }
                Spacer()
                
                WeekRowView(days: Array(selectedCity.forecast.dropFirst()))
                
                Spacer()
            }
        }
    }
}

struct WeatherCombinedView_Previews: PreviewProvider {
    @State static var selectedCity = sampleCities[0]
    
    static var previews: some View {
        WeatherCombinedView(cities: sampleCities)
    }
}
