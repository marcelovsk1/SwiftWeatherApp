//
//  BlobShape.swift
//  WeatherApp
//
//  Created by Marcelo Amaral Alves on 2023-10-11.
//

import SwiftUI

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.4974*width, y: 0.11205*height))
        path.addCurve(to: CGPoint(x: 0.76912*width, y: 0.00454*height), control1: CGPoint(x: 0.59768*width, y: 0.10326*height), control2: CGPoint(x: 0.67314*width, y: -0.0222*height))
        path.addCurve(to: CGPoint(x: 0.89135*width, y: 0.2218*height), control1: CGPoint(x: 0.85858*width, y: 0.02946*height), control2: CGPoint(x: 0.84853*width, y: 0.14914*height))
        path.addCurve(to: CGPoint(x: 0.99929*width, y: 0.39523*height), control1: CGPoint(x: 0.92625*width, y: 0.28105*height), control2: CGPoint(x: 0.99484*width, y: 0.32879*height))
        path.addCurve(to: CGPoint(x: 0.91518*width, y: 0.57761*height), control1: CGPoint(x: 1.00372*width, y: 0.46145*height), control2: CGPoint(x: 0.92189*width, y: 0.51155*height))
        path.addCurve(to: CGPoint(x: 0.95683*width, y: 0.8131*height), control1: CGPoint(x: 0.90704*width, y: 0.65773*height), control2: CGPoint(x: 0.98341*width, y: 0.73606*height))
        path.addCurve(to: CGPoint(x: 0.77252*width, y: 0.99114*height), control1: CGPoint(x: 0.93012*width, y: 0.89053*height), control2: CGPoint(x: 0.86029*width, y: 0.96433*height))
        path.addCurve(to: CGPoint(x: 0.4974*width, y: 0.95343*height), control1: CGPoint(x: 0.68382*width, y: 1.01824*height), control2: CGPoint(x: 0.58956*width, y: 0.96959*height))
        path.addCurve(to: CGPoint(x: 0.271*width, y: 0.90323*height), control1: CGPoint(x: 0.42008*width, y: 0.93988*height), control2: CGPoint(x: 0.34215*width, y: 0.93281*height))
        path.addCurve(to: CGPoint(x: 0.0837*width, y: 0.78141*height), control1: CGPoint(x: 0.19976*width, y: 0.87361*height), control2: CGPoint(x: 0.11783*width, y: 0.8433*height))
        path.addCurve(to: CGPoint(x: 0.09027*width, y: 0.5755*height), control1: CGPoint(x: 0.04912*width, y: 0.7187*height), control2: CGPoint(x: 0.09733*width, y: 0.64477*height))
        path.addCurve(to: CGPoint(x: 0.04538*width, y: 0.40512*height), control1: CGPoint(x: 0.08429*width, y: 0.51673*height), control2: CGPoint(x: 0.05582*width, y: 0.46342*height))
        path.addCurve(to: CGPoint(x: 0.0161*width, y: 0.16128*height), control1: CGPoint(x: 0.03074*width, y: 0.32335*height), control2: CGPoint(x: -0.02668*width, y: 0.23522*height))
        path.addCurve(to: CGPoint(x: 0.25086*width, y: 0.04995*height), control1: CGPoint(x: 0.05665*width, y: 0.09119*height), control2: CGPoint(x: 0.16119*width, y: 0.05912*height))
        path.addCurve(to: CGPoint(x: 0.4974*width, y: 0.11205*height), control1: CGPoint(x: 0.33691*width, y: 0.04115*height), control2: CGPoint(x: 0.41118*width, y: 0.11961*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    BlobShape()
}
