//
//  DaysModel.swift
//  BallWeatherApp
//
//  Created by Tykhon on 26.11.2025.
//

import Foundation

var citiesForecast: [City] = load("weather.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        assert(false, "Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}



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

struct City: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    var forecast: [Day]
}

struct Day: Identifiable, Codable, Hashable {
    let day: String
    let weather: Weather
    var tempC: Int
    var id: String { day }
}

func isNightTime() -> Bool {
    let now = Date()
    let calendar = Calendar.current
    
    let hour = calendar.component(.hour, from: now)
    
    return hour >= 20 || hour < 6
}



//let days: [Day] = [
//    Day(day: "Mon", weather: .sunnyCloudy, tempC: 10),
//    Day(day: "Tue", weather: .rainy, tempC: 5),
//    Day(day: "Wed", weather: .snowy, tempC: -3),
//    Day(day: "Thu", weather: .cloudy, tempC: 8),
//    Day(day: "Fri", weather: .sunny, tempC: 14),
//    Day(day: "Sat", weather: .sunny, tempC: 13),
//    Day(day: "Sun", weather: .sunnyCloudy, tempC: 9),
//    Day(day: "Mon", weather: .sunnyCloudy, tempC: 9)
//]
//
//let sampleCities: [City] = [
//    City(
//        id: UUID(),
//        name: "Kyiv",
//        forecast: days
//    ),
//
//    City(
//        id: UUID(),
//        name: "Kharkiv",
//        forecast: [
//            Day(day: "Mon", weather: .cloudy, tempC: 7),
//            Day(day: "Tue", weather: .rainy, tempC: 4),
//            Day(day: "Wed", weather: .rainy, tempC: 6),
//            Day(day: "Thu", weather: .sunny, tempC: 11),
//            Day(day: "Fri", weather: .sunnyCloudy, tempC: 10),
//            Day(day: "Sat", weather: .cloudy, tempC: 8),
//            Day(day: "Sun", weather: .sunny, tempC: 12),
//            Day(day: "Mon", weather: .sunny, tempC: 15)
//        ]
//    ),
//
//    City(
//        id: UUID(),
//        name: "Chernigiv",
//        forecast: [
//            Day(day: "Mon", weather: .sunny, tempC: 15),
//            Day(day: "Tue", weather: .sunnyCloudy, tempC: 14),
//            Day(day: "Wed", weather: .cloudy, tempC: 13),
//            Day(day: "Thu", weather: .sunny, tempC: 17),
//            Day(day: "Fri", weather: .sunny, tempC: 18),
//            Day(day: "Sat", weather: .sunnyCloudy, tempC: 16),
//            Day(day: "Sun", weather: .cloudy, tempC: 14),
//            Day(day: "Mon", weather: .sunnyCloudy, tempC: 10)
//        ]
//    )
//]
