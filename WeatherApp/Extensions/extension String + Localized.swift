//
//  extension String + Localized.swift
//  WeatherApp
//
//  Created by Louise on 06/02/24.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
