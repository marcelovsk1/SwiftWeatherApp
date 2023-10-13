//
//  ContentView.swift
//  WeatherApp
//
//  Created by Marcelo Amaral Alves on 2023-10-11.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    private var weatherManager = WeatherManager()
    @State var weather: WeatherManager.WeatherResponse?
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            weatherManager.getWeatherData(for: location) {
                                result in
                                switch result {
                                    
                                case .success(let weather):
                                    self.weather = weather
                                case .failure(let error):
                                    print("Error getting data, \(error)")
                                }
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView(locationManager: locationManager)
                    }
                }
        }
     
    }
}

#Preview {
    ContentView()
}
