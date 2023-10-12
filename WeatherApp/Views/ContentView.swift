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
    @State var weather: WeatherResponse?
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Current coordinates, \(location.longitude), \(location.latitude)")
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
