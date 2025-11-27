//
//  DaysModel.swift
//  BallWeatherApp
//
//  Created by Tykhon on 26.11.2025.
//

import Foundation

enum Weather: String, Codable, CaseIterable {
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
            return "cloud.snow.fill"
        }
    }
}

struct Day: Identifiable, Codable, Hashable {
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
    Day(day: "Fri", weather: .sunny, temp: 14),
    Day(day: "Sat", weather: .sunny, temp: 13),
    Day(day: "Sun", weather: .sunnyCloudy, temp: 9),
    Day(day: "Mon", weather: .sunnyCloudy, temp: 9)
]


struct City: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    var forecast: [Day]
}


let sampleCities: [City] = [
    City(
        id: UUID(),
        name: "Kyiv",
        forecast: days
    ),

    City(
        id: UUID(),
        name: "Kharkiv",
        forecast: [
            Day(day: "Mon", weather: .cloudy, temp: 7),
            Day(day: "Tue", weather: .rainy, temp: 4),
            Day(day: "Wed", weather: .rainy, temp: 6),
            Day(day: "Thu", weather: .sunny, temp: 11),
            Day(day: "Fri", weather: .sunnyCloudy, temp: 10),
            Day(day: "Sat", weather: .cloudy, temp: 8),
            Day(day: "Sun", weather: .sunny, temp: 12),
            Day(day: "Mon", weather: .sunny, temp: 15)
        ]
    ),

    City(
        id: UUID(),
        name: "Chernigiv",
        forecast: [
            Day(day: "Mon", weather: .sunny, temp: 15),
            Day(day: "Tue", weather: .sunnyCloudy, temp: 14),
            Day(day: "Wed", weather: .cloudy, temp: 13),
            Day(day: "Thu", weather: .sunny, temp: 17),
            Day(day: "Fri", weather: .sunny, temp: 18),
            Day(day: "Sat", weather: .sunnyCloudy, temp: 16),
            Day(day: "Sun", weather: .cloudy, temp: 14),
            Day(day: "Mon", weather: .sunnyCloudy, temp: 10)
        ]
    )
]
