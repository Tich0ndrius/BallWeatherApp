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
                HStack(spacing: 4) {
                    ForEach(days.dropFirst()){ day in
                        VStack(spacing: 4) {
                            Text("\(day.day)")
                                .font(.system(size: 22, weight: .bold, design: .default))
                                .foregroundStyle(.white)
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
                                .lineLimit(1)
                                .padding(.bottom)
                        }
                        .frame(minWidth: 40, idealWidth: 56, maxHeight: 180)
                        .padding(14)
                        Divider()
                            .frame(maxHeight: 180)
                    } //end of ForEach
                }
                .frame(minWidth: geo.size.width, alignment: .center)
            }
            .padding()
        }//end of GeometryReader
    }
}

struct WeekRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeekRowView(days: citiesForecast[0].forecast
        )
            .background(.mint)
    }
}
