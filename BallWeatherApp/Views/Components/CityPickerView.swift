//
//  CityButtonView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 26.11.2025.
//

import SwiftUI

struct CityPickerView: View {
    let cities: [City]
    @Binding var selectedCity: City

        var body: some View {
            Picker("City", selection: $selectedCity) {
                ForEach(cities) { city in
                    Text(city.name).tag(city)
                }
            }
            .pickerStyle(.menu)
            .padding(.horizontal)
    }
}

struct CityButtonView_Previews: PreviewProvider {
    @State static var selectedCity = sampleCities[0]
    
    static var previews: some View {
        CityPickerView(cities: sampleCities, selectedCity: $selectedCity)
    }
}
