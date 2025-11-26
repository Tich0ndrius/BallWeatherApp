//
//  DayRowView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 26.11.2025.
//

import SwiftUI

struct DayRowView: View {
    let days: [Day]
    
    var body: some View {
        ZStack{
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(days.dropFirst()){ day in
                        VStack {
                            DayColumnView(day: day)
                        }
                    }
                }
            }
        }
    }
}

struct DayRowView_Previews: PreviewProvider {
    static var previews: some View {
        DayRowView(days: [
            Day(day: "Mon", weather: .sunnyCloudy, temp: 10),
            Day(day: "Tue", weather: .rainy, temp: 5),
            Day(day: "Wed", weather: .snowy, temp: -3),
            Day(day: "Thu", weather: .cloudy, temp: 8),
            Day(day: "Fri", weather: .sunny, temp: 14)]
        )
    }
}
