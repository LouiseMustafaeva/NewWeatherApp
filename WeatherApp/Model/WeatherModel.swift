//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Louise on 05/02/24.
//

import Foundation

struct WeatherModel: Decodable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
    
    
    struct Location: Decodable {
        let name: String
    }
    
    struct Current: Decodable {
        let temp_c: Int
    }
    
    struct Forecast: Decodable {
        let forecastday: [ForecastDay]
        
        struct ForecastDay: Decodable {
            let date: String
            let day: Day
            let hour: [Hour]
            
            struct Day: Decodable {
                let maxtemp_c: Float
                let mintemp_c: Float
                let condition: Condition
            }
            
            struct Hour: Decodable {
                let time: String
                let temp_c: Float
            }
            
            struct Condition: Decodable {
                let icon: String
            }
        }
    }
}
