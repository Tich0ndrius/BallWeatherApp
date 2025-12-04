//
//  DayRowView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 26.11.2025.
//

import SwiftUI

struct WeekRowView: View {
    let days: [Day]
    @State private var isNight = false
    @Environment(\.colorScheme) var colorScheme
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            isNight = isNightTime()
        }
        
    }
    
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
                                .minimumScaleFactor(0.6)
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
                                        .frame(minWidth: 36, idealWidth: 48, maxWidth: 48, minHeight: 36, idealHeight: 48, maxHeight: 48)
                                        .shadow(radius: 2)
                                )
                                .overlay {
                                    Circle()
                                        .stroke(.blue, lineWidth: 2)
                                }
                                .shadow(radius: 2)
                            
                            Text(temperatureText(for: day))
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundStyle(.white)
                                .scaledToFit()
                                .minimumScaleFactor(0.6)
                                .lineLimit(1)
                                .padding(.bottom)
                        }
                        .frame(minWidth: 40, idealWidth: 56, maxHeight: 180)
                        .padding()
                        Divider()
                            .frame(maxHeight: 180)
                    } //end of ForEach
                }
                .frame(minWidth: geo.size.width, alignment: .center)
            }
            //Window for days ScrollView
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isNight || colorScheme.isDark ? Color(.black) : Color("darkBlue"))
                    .frame(width: 400, height: 180)
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
        }//end of GeometryReader
    }
}

struct WeekRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeekRowView(days: citiesForecast[0].forecast
        )
    }
}
