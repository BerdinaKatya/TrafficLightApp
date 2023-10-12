//
//  TrafficLightView.swift
//  TrafficLight
//
//  Created by Екатерина Теляубердина on 12.10.2023.
//

import SwiftUI

struct TrafficLightView: View {
    let color: Color
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

#Preview {
    TrafficLightView(color: .red)
}
