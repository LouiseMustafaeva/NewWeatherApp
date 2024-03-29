//
//  extension String+DateFormatter.swift
//  WeatherApp
//
//  Created by Louise on 06/02/24.
//

import Foundation

extension String {
    func weekday() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: self) {
            var calendar = Calendar.current
            calendar.timeZone = TimeZone.current
            let weekday = calendar.component(.weekday, from: date)
            
            let weekdays = dateFormatter.weekdaySymbols
            let weekdayString = weekdays?[weekday - 1]
            
            return weekdayString
        } else {
            return nil
        }
    }
    
    func convertToHours() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH:mm"
            outputFormatter.timeZone = TimeZone.current
            
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
}
