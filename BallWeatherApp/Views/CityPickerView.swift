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
        HStack{
            Picker("City", selection: $selectedCity) {
                ForEach(cities) { city in
                    Text(city.name)
                        .tag(city)
                }
            }
            .pickerStyle(.menu)
            .padding(.horizontal)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.white))
                .frame(width: 180, height: 40)
        )
    }
}

struct CityButtonView_Previews: PreviewProvider {
    @State static var selectedCity = citiesForecast[0]
    
    static var previews: some View {
        Group{
            CityPickerView(cities: citiesForecast, selectedCity: $selectedCity)
        }
        .previewLayout(.fixed(width: 200, height: 80))
        .background(
            Rectangle()
                .fill(Color(.blue))
                .frame(width: 20, height: 40)
        )
    }
}
