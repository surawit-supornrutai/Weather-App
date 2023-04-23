//
//  DailyWeatherModel.swift
//  OpenWeather
//
//  Created by jung on 12/4/2566 BE.
//

import Foundation

// MARK: - DailyWeatherModel
struct DailyWeatherModel: Decodable {
    let list: [ListDaily]
}

// MARK: - Coord
struct CoordDaily: Decodable {
    let lat, lon: Double
}

// MARK: - List
struct ListDaily: Decodable {
    let dt: TimeInterval
    let main: WeatherDaily
    let weather: [WeatherDescription]
    let clouds: CloudsDaily
    let wind: WindDaily
    let visibility: Int
    let pop: Float
    let sys: SysDaily
    let dtTxt: String

    private enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
    }
}

// Define models for the different properties of a weather forecast
struct WeatherDaily: Decodable {
    let temp: Float
    let feelsLike: Float
    let tempMin: Float
    let tempMax: Float
    let pressure: Int
    let seaLevel: Int?
    let grndLevel: Int?
    let humidity: Int
    let tempKf: Float?

    private enum CodingKeys: String, CodingKey {
        case temp, feelsLike = "feels_like", tempMin = "temp_min", tempMax = "temp_max", pressure, seaLevel = "sea_level", grndLevel = "grnd_level", humidity, tempKf = "temp_kf"
    }
}

struct WeatherDescription: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct CloudsDaily: Decodable {
    let all: Int
}

struct WindDaily: Decodable {
    let speed: Float
    let deg: Int
}

struct SysDaily: Decodable {
    let pod: String
}
