//
//  ContentView.swift
//  TrafficLight
//
//  Created by Екатерина Теляубердина on 12.10.2023.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    @State private var buttonText = "START"
    @State private var currentLight = CurrentLight.red
    @State private var redOpacity: Double = 0.5
    @State private var yellowOpacity: Double = 0.5
    @State private var greenOpacity: Double = 0.5
    
    var body: some View {
        Color.black
            .ignoresSafeArea()
            .overlay {
                VStack {
                    TrafficLightView(color: .red)
                        .opacity(redOpacity)
                    TrafficLightView(color: .yellow)
                        .padding(.top, 16)
                        .opacity(yellowOpacity)
                    TrafficLightView(color: .green)
                        .padding(.top, 16)
                        .opacity(greenOpacity)
                    
                    Spacer()
                    
                    Button(action: switchTrafficLightButtonTapped) {
                        Text(buttonText)
                            .font(.title)
                    }
                    .padding()
                    .frame(width: 150, height: 60)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule(style: .continuous))
                    .overlay(Capsule(style: .continuous).stroke(Color.white, lineWidth: 4))
                }
                .padding(.bottom, 100)
            }
    }
    
    private func switchTrafficLightButtonTapped() {
        
        if  buttonText == "START" {
            buttonText = "RUN"
        }
        
        switch currentLight {
        case .red:
            greenOpacity = 0.5
            redOpacity = 1.0
            currentLight = CurrentLight.yellow
        case .yellow:
            redOpacity = 0.5
            yellowOpacity = 1.0
            currentLight = CurrentLight.green
        case .green:
            yellowOpacity = 0.5
            greenOpacity = 1.0
            currentLight = CurrentLight.red
        }
    }
}

#Preview {
    ContentView()
}
