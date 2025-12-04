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
                .minimumScaleFactor(0.6)
                .lineLimit(1)
                .padding(.top)
            
            Circle()
                .fill(.white)
                .frame(minWidth: 96, maxWidth: 180, minHeight: 96, maxHeight: 180)
                .overlay(
                    Image(systemName: day.weather.iconName())
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 66, maxWidth: 144, minHeight: 66, maxHeight: 144)
                        .shadow(radius: 2)
                        .clipShape(Circle())
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
                .minimumScaleFactor(0.6)
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
