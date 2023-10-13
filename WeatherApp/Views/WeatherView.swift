//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Marcelo Amaral Alves on 2023-10-12.
//

import SwiftUI

struct WeatherView: View {
    @State var weather: WeatherResponse
    @State private var isAnimating = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                // search bar func
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("\($weather.name), \(weather.sys.country)")
                        .foregroundColor(.black)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                        .foregroundColor(.black)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onAppear {
            isAnimating = true
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(.white)
    }
}

