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
//                    SearchBarView(weather: $weather)
//                        .frame(maxWidth: .infinity)
                    
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
                        HStack {
                            VStack(spacing: 20) {
                                Image(systemName: weather.conditionName)
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                Text(weather.weather[0].description.capitalized)
                            }
                            .frame(width: 150, alignment: .leading)
                            
                            Spacer()
                            
                            Text(weather.main.temp.roundDouble() + "°")
                                .font(.system(size: 100))
                                .bold()
                                .padding()
                                .foregroundColor(.black)
                        }
                        
                        Image("londonimage")
                            .resizable()
                            .cornerRadius(15)
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .ignoresSafeArea()
                            .opacity(isAnimating ? 1 : 0)
                            .offset(y: isAnimating ? 0 : -40)
                            .animation(.easeOut, value: isAnimating)
                        
                        Spacer()
                    
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Spacer()
                    Divider()
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now")
                            .bold()
                            .padding(.bottom)
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                                WeatherRow(logo: "thermommeter", name: "Max temp", value: weather.main.tempMax.roundDouble() + "°")
                                WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                                WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 125, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                }
                
            }
            .onAppear {
                isAnimating = true
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(.white)
        }
    }
}

