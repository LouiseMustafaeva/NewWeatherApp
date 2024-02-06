//
//  Constants.swift
//  WeatherApp
//
//  Created by Louise on 06/02/24.
//

import Foundation

enum Constants {
    
    enum Sizes {
        static let s: CGFloat = 60
        static let m: CGFloat = 100
        static let l: CGFloat = 120
        static let xl: CGFloat = 150
    }
    
    enum FontNames {
        static let avenirNext = "AvenirNext"
        static let avenirNextBold = "AvenirNext-bold"
    }
    
    enum FontSizes {
        static let s: CGFloat = 15
        static let m: CGFloat = 20
        static let l: CGFloat = 22
        static let xl: CGFloat = 60
        static let xxl: CGFloat = 75
    }
    
    enum Url {
        static let mainUrl = "http://api.weatherapi.com/v1/forecast.json?key=8783c9466d0e48c7912160458240402&"
    }
}
