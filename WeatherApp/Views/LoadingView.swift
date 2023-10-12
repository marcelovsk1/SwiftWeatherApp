//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Marcelo Amaral Alves on 2023-10-11.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Please wait a moment 😊")
                .padding(15)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
        }
    }
}

#Preview {
    LoadingView()
}
