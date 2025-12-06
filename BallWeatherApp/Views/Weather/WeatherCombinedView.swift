//
//  DayCombinedView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 27.11.2025.
//

import SwiftUI

struct WeatherCombinedView: View {
    
    @State private var selectedCity = citiesForecast[0]
    
    @State private var isNight = false
    @Environment(\.colorScheme) var colorScheme
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            isNight = isNightTime()
        }
    }
    
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
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isNight || colorScheme.isDark ? Color(.gray) : Color("darkBlue"))
                        .frame(width: 380, height: 180)
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black.opacity(0.2), lineWidth: 4)
                        .blur(radius: 2)
                        .offset(x: 0, y: 2)
                        .mask(
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 400, height: 180)
                        )
                        .frame(width: 380, height: 180)
                    ZStack(){
                        WeekRowView(days: Array(selectedCity.forecast))
                            .id(selectedCity.id).transition(.opacity)
                    }
                    .frame(width: 400, height: 210)
                    .animation(.easeInOut(duration: 0.5), value: selectedCity)
                    .onAppear{
                        isNight = isNightTime()
                        startTimer()
                    }
                }
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
