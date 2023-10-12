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
                VStack {
                    // search bar functionality
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(weather.name), \(weather.sys.country)")
                            .foregroundColor(.black)
                            .bold()
                            .font(.title)
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                    
                    Spacer()
                    
                    VStack {
                        HStack{
                            VStack(spacing: 20) {
                                Image(systemName: weather.conditionName)
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                Text(weather.weather[0].description.capitalized)
                            }
                            .frame(width: 150, alignment: .leading)
                            
                            Spacer()
                        }
                    }
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
}

