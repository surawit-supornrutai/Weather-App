//
//  DailyWeatherModel.swift
//  OpenWeather
//
//  Created by jung on 12/4/2566 BE.
//

import Foundation

// MARK: - DailyWeatherModel
struct DailyWeatherModel: Codable {
    let cod: String
    let message, cnt: Int
    let list: [ListDaily]
    let city: CityDaily
}

// MARK: - City
struct CityDaily: Codable {
    let id: Int
    let name: String
    let coord: CoordDaily
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct CoordDaily: Codable {
    let lat, lon: Double
}

// MARK: - List
struct ListDaily: Codable {
    let dt: Int
    let main: MainClass
    let weather: [WeatherDaily]
    let clouds: CloudsDaily
    let wind: WindDaily
    let visibility: Int
    let pop: Double
    let sys: SysDaily
    let dtTxt: String
    let rain: RainDaily?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
    }
}

// MARK: - Clouds
struct CloudsDaily: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct RainDaily: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct SysDaily: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct WeatherDaily: Codable {
    let id: Int
    let main: MainEnum
    let description: Description
    let icon: Icon
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

enum Icon: String, Codable {
    case the01N = "01n"
    case the02D = "02d"
    case the03N = "03n"
    case the04D = "04d"
    case the04N = "04n"
    case the10N = "10n"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: - Wind
struct WindDaily: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
