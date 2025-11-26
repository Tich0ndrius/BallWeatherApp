//
//  DaysModel.swift
//  BallWeatherApp
//
//  Created by Tykhon on 26.11.2025.
//

import Foundation

enum Weather {
    case sunny
    case rainy
    case cloudy
    case sunnyCloudy
    case snowy
    
    func iconName() -> String {
        switch self {
        case .sunny:
            return "sun.max.fill"
        case .rainy:
            return "cloud.rain.fill"
        case .cloudy:
            return "cloud.fill"
        case .sunnyCloudy:
            return "cloud.sun.fill"
        case .snowy:
            return "cloud.snow"
        }
    }
}

struct Day: Identifiable {
    let day: String
    let weather: Weather
    var temp: Int
    var id: String { day }
}

let days: [Day] = [
    Day(day: "Mon", weather: .sunnyCloudy, temp: 10),
    Day(day: "Tue", weather: .rainy, temp: 5),
    Day(day: "Wed", weather: .snowy, temp: -3),
    Day(day: "Thu", weather: .cloudy, temp: 8),
    Day(day: "Fri", weather: .sunny, temp: 14)
]
