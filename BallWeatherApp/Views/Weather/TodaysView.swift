//
//  DayColumnView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 26.11.2025.
//

import SwiftUI

struct TodaysView: View {
    let day: Day
    var body: some View {
        VStack(spacing: 8){
            Text("\(day.day)")
                .font(.system(size: 44, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .scaledToFit()
                .minimumScaleFactor(0.8)
                .lineLimit(1)
                .padding(.top)
            
            Circle()
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
            
            Text(temperatureText(for: day))
                .font(.system(size: 40, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .scaledToFit()
                .minimumScaleFactor(0.8)
                .lineLimit(1)
                .padding(.bottom)
        }
    }
}

struct TodaysView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TodaysView(day: citiesForecast[0].forecast[0])
        }
        .previewLayout(.fixed(width: 240, height: 320))
        .background(
            Rectangle()
                .fill(Color(.blue))
                .frame(width: 240, height: 400)
        )
    }
}
