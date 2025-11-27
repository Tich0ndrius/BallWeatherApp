//
//  DayCombinedView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 27.11.2025.
//

import SwiftUI

struct DayCombinedView: View {
    
    @Binding var selectedCity: City
    let cities: [City]
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.mint, .blue]),
                           startPoint:.topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                CityPickerView(cities: cities, selectedCity: $selectedCity)
                //is there a better method?
                if let today = selectedCity.forecast.first {
                    DayColumnView(day: today)
                }
                Spacer()
                
                DayRowView(days: Array(selectedCity.forecast.dropFirst()))
                
                
                Spacer()
            }
        }
    }
}

struct DayCombinedView_Previews: PreviewProvider {
    @State static var selectedCity = sampleCities[0]
    
    static var previews: some View {
        DayCombinedView(selectedCity: $selectedCity, cities: sampleCities)
    }
}
