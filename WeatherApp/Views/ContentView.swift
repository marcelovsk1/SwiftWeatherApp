//
//  ContentView.swift
//  WeatherApp
//
//  Created by Marcelo Amaral Alves on 2023-10-11.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            WelcomeView(locationManager: locationManager)
        }
     
    }
}

#Preview {
    ContentView()
}
