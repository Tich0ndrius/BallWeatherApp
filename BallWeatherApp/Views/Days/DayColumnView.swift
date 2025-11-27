//
//  DayColumnView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 26.11.2025.
//

import SwiftUI

struct DayColumnView: View {
    let day: Day
    var body: some View {
        VStack(spacing: 8){
            Text("\(day.day)")
                .font(.system(size: 44, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding(.top)
            
            Capsule()
                .fill(.white)
                .frame(width: 180, height: 180)
                .overlay(
                    Image(systemName: day.weather.iconName())
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 144, height: 144)
                        .shadow(radius: 2)
                )
                .overlay {
                    Circle()
                        .stroke(.blue, lineWidth: 4)
                }
                .shadow(radius: 4)
            
            Text("\(day.temp)" + " °C")
                .font(.system(size: 40, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding(.bottom)
        }
    }
}

struct DayColumnView_Previews: PreviewProvider {
    static var previews: some View {
        DayColumnView(day: Day(day: "Mon", weather: .sunnyCloudy, temp: 7))
    }
}
