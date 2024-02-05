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
            let calendar = Calendar.current
            let weekday = calendar.component(.weekday, from: date)

            let weekdays = dateFormatter.weekdaySymbols
            let weekdayString = weekdays?[weekday - 1]

            return weekdayString
        } else {
            return nil
        }
    }
}
