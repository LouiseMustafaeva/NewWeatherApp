//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Louise on 05/02/24.
//

import UIKit

enum FavoriteDays {
    case threeDays
    case sevenDays
    case tenDays
}

enum NetworkingError: Error {
    case badURL
    case invalidData
}

class NetworkManager {
    let weatherURL = Constants.Url.mainUrl
    
    func createURLString(type: FavoriteDays) -> String {
        var days: Int
        
        switch type {
        case .threeDays:
            days = 3
        case .sevenDays:
            days = 7
        case .tenDays:
            days = 10
        }
        return "\(weatherURL)&q=Tashkent&days=\(days)&aqi=no&alerts=no"
    }
    
    func doRequest(type: FavoriteDays) async throws -> WeatherModel {
        
        let urlString = createURLString(type: type)
        let url = URL(string: urlString)
        
        guard let url = url else {
            throw NetworkingError.badURL
        }
        
        let data = try await fetchDataFromURL(url: url)
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(WeatherModel.self, from: data)
        
        return result
    }
    
    func fetchDataFromURL(url: URL) async throws -> Data {
        if let cachedData = getCachedData(for: url) {
            return cachedData
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            cacheData(data, for: url)
            return data
        } catch {
            throw error
        }
    }
    
    func getCachedData(for url: URL) -> Data? {
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return cachedResponse.data
        }
        return nil
    }
    
    func cacheData(_ data: Data, for url: URL) {
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
    }
}
