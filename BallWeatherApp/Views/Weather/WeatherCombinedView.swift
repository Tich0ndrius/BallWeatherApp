//
//  DayCombinedView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 27.11.2025.
//

import SwiftUI

struct WeatherCombinedView: View {
    
    @State private var selectedCity = citiesForecast[0]
    
    let cities: [City]
    
    var body: some View {
        ZStack{
            BackgroundColorView()
            
            VStack{
                CityPickerView(cities: cities, selectedCity: $selectedCity)
                //is there a better method?
                ZStack{
                    if let today = selectedCity.forecast.first {
                        TodaysView(day: today)
                            .id(selectedCity.id).transition(.opacity)
                    }
                }
                .animation(.easeInOut(duration: 0.5), value: selectedCity)
                Spacer()
                
                ZStack{
                    WeekRowView(days: Array(selectedCity.forecast))
                        .id(selectedCity.id).transition(.opacity)
                }
                .animation(.easeInOut(duration: 0.5), value: selectedCity)
                Spacer()
            }
        }
    }
}

struct WeatherCombinedView_Previews: PreviewProvider {
    @State static var selectedCity = citiesForecast[0]
    
    static var previews: some View {
        WeatherCombinedView(cities: citiesForecast)
    }
}
