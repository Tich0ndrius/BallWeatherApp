//
//  TemperatureFormatter.swift
//  BallWeatherApp
//
//  Created by Tykhon on 30.11.2025.
//

import Foundation


func formattedTemperature(celsius: Int) -> String {
    let temp = Measurement(value: Double(celsius), unit: UnitTemperature.celsius)

    let formatter = MeasurementFormatter()
    formatter.locale = Locale.current
    formatter.unitOptions = .naturalScale
    formatter.numberFormatter.maximumFractionDigits = 0
    formatter.unitStyle = .medium

    return formatter.string(from: temp)
}

func temperatureText(for day: Day) -> String {
    formattedTemperature(celsius: day.tempC)
}

