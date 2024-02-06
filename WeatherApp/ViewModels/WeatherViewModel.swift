//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Louise on 05/02/24.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    
    private let networkManager = NetworkManager()
    @Published var model: WeatherModel?
    func getDataFromNetwork(type: FavoriteDays) async throws {
        Task {
            model = try await networkManager.doRequest(type: type)
        }
    }
    
    func getForecastDays() async throws -> [WeatherModel.Forecast.ForecastDay] {
        return model?.forecast?.forecastday ?? []
    }
    
    func getHours(array: [WeatherModel.Forecast.ForecastDay], index: Int) async throws -> [WeatherModel.Forecast.ForecastDay.Hour] {
        return array[index].hour
    }
}
