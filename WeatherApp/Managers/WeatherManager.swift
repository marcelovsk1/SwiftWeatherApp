//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Marcelo Amaral Alves on 2023-10-11.
//

import Foundation
import CoreLocation

class WeatherManager {
    private let apiKey = "d17735e5cec9ef34430f73a92b7fdc37"
    
    func getWeatherData(for coordinate: CLLocationCoordinate2D, completion: @escaping
                        (Result<WeatherResponse, WeatherError>) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=\(apiKey)&units=metric") else {
            completion(.failure(WeatherError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(WeatherError.invalidData))
                return
            }
            
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(weatherResponse)) // Use 'weatherResponse' (instância) em vez de 'WeatherResponse' (tipo)
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
        
    }
    
    enum WeatherError: Error {
        case invalidURL
        case invalidData
    }
    
    
    struct WeatherResponse: Decodable {
        var weather: [WeatherDetails]
        var main: MainResponse
        var name: String
        var wind: WindResponse
        var sys: Country
        
        struct WeatherDetails: Decodable {
            var id: Double
            var main: String
            var description: String
            var icon: String
        }
        struct MainResponse: Decodable {
            var temp: Double
            var feels_like: Double
            var temp_min: Double
            var temp_max: Double
            var pressure: Double
            var humidity: Double
        }
        
        struct WindResponse: Decodable {
            var speed: Double
        }
        struct Country: Decodable {
            var country: String
        }
        
        var conditionName: String {
            guard let firstWeather = weather.first else { return "cloud" }
            
            switch firstWeather.id {
            case 200...232:
                return "cloud.bolt"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud.bolt"
            default:
                return "cloud"
            }
        }
        
    }
}
    
extension WeatherManager.WeatherResponse.MainResponse {
    var tempMin: Double {
        return temp_min
    }
    var tempMax: Double {
        return temp_max
    }
}

