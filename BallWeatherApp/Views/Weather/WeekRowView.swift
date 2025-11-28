//
//  DayRowView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 26.11.2025.
//

import SwiftUI

struct WeekRowView: View {
    let days: [Day]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(days.dropFirst()){ day in
                        VStack(spacing: 4) {
                            Text("\(day.day)")
                                .font(.system(size: 22, weight: .bold, design: .default))
                                .foregroundStyle(.white)
                                .scaledToFit()
                                .minimumScaleFactor(0.8)
                                .lineLimit(1)
                                .padding(.top)
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Image(systemName: day.weather.iconName())
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 48, height: 48)
                                        .shadow(radius: 2)
                                )
                                .overlay {
                                    Circle()
                                        .stroke(.blue, lineWidth: 2)
                                }
                                .shadow(radius: 2)
                            
                            Text("\(day.temp)" + " °C")
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundStyle(.white)
                                .scaledToFit()
                                .minimumScaleFactor(0.8)
                                .lineLimit(1)
                                .padding(.bottom)
                        }
                        .frame(minWidth: 40, idealWidth: 56, maxHeight: 180)
                        .padding()
                        Divider()
                            .frame(maxHeight: 180)
                        
                    }
                }
                .frame(minWidth: geo.size.width, alignment: .center)
            }
            .navigationTitle("Week")
            //Window for days ScrollView
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("darkBlue"))
                    .frame(width: 400, height: 180)
//                    .fill(LinearGradient(gradient: Gradient(colors: [.mint, Color("darkBlue")]),
//                                         startPoint:.topLeading,
//                                         endPoint: .bottomTrailing)
//                          )
            )
            //Inner shadow effect for window
            .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.black.opacity(0.2), lineWidth: 4)
                        .blur(radius: 2)
                        .offset(x: 0, y: 2)
                        .mask(
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 400, height: 180)
                        )
                        .frame(width: 400, height: 180)
                    )
            .padding()
        }
    }
}

struct WeekRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeekRowView(days: [
            Day(day: "Mon", weather: .sunnyCloudy, temp: 10),
            Day(day: "Tue", weather: .rainy, temp: 5),
            Day(day: "Wed", weather: .snowy, temp: -3),
            Day(day: "Thu", weather: .cloudy, temp: 8),
            Day(day: "Fri", weather: .sunny, temp: 14),
            Day(day: "Sat", weather: .sunny, temp: 13),
            Day(day: "Sun", weather: .sunnyCloudy, temp: 9),
            Day(day: "Mon", weather: .sunnyCloudy, temp: 9)]
        )
    }
}
