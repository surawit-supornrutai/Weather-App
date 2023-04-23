//
//  Connection.swift
//  OpenWeather
//
//  Created by jung on 11/4/2566 BE.
//

import Foundation

class Connection {
    
    static let APIKey = "8cb8bf5ff12d5239fd40845434aa6a61"
    
    static let API = "https://api.openweathermap.org/data/2.5/"
    
    static let API_get_current = "weather"
    static let API_get_daily = "forecast"
    
    static func getAPI(apiName: String) -> String {
        return API + apiName
    }
    
}
