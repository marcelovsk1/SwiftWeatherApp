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
            
            BlobShape()
                .frame(width: 400, height: 425)
                .foregroundStyle(.linearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(isAnimating ? 1 : 0) // view should be completely transparent
                .offset(y: isAnimating ? 0 : -40) // control the view positon
                .animation(.easeOut(duration: 4), value: isAnimating) // time of the animation
            
            VStack {
                VStack(spacing: 20) {
                    Text("Welcome to the iWeather")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Share your present location to provide the weather information for your area")
                        .padding()
                        .foregroundColor(.white)
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
        .onAppear {
            isAnimating = true
        }
    }
    
}


#Preview {
    WelcomeView(locationManager: LocationManager())
}
