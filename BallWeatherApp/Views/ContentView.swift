//
//  ContentView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 25.11.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.mint, .blue]),
                           startPoint:.topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                CityButtonView()
//                Spacer()
                DayColumnView(day: Day(day: "Mon", weather: .sunnyCloudy, temp: 7))
                Spacer()
                
                DayRowView(days: [
                    Day(day: "Mon", weather: .sunnyCloudy, temp: 10),
                    Day(day: "Tue", weather: .rainy, temp: 5),
                    Day(day: "Wed", weather: .snowy, temp: -3),
                    Day(day: "Thu", weather: .cloudy, temp: 8),
                    Day(day: "Fri", weather: .sunny, temp: 14),
                    Day(day: "Sat", weather: .sunny, temp: 13),
                    Day(day: "Sun", weather: .sunnyCloudy, temp: 9),
                    Day(day: "Mon", weather: .sunnyCloudy, temp: 9)]
                )
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


