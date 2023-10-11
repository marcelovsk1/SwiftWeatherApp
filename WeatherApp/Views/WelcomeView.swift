//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Marcelo Amaral Alves on 2023-10-11.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @ObservedObject var locationManager: LocationManager
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 20) {
                    Text("Welcome to the iWeather")
                        .bold()
                        .font(.title)
                    Text("Share your present location to provide the weather information for your area")
                        .padding()
                }
                .multilineTextAlignment(.center)
                .padding()
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}


#Preview {
    WelcomeView(locationManager: LocationManager())
}
