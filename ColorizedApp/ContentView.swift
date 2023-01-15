//
//  ContentView.swift
//  ColorizedApp
//
//  Created by Irunchik on 14.01.23.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...250)
    @State private var greenSliderValue = Double.random(in: 0...250)
    @State private var blueSliderValue = Double.random(in: 0...250)
    var body: some View {
        ZStack {
            Color
                .blue
                .opacity(0.8)
                .ignoresSafeArea()
            VStack {
                RoundedRectangleView(redSliderValue: $redSliderValue, greenSliderValue: $greenSliderValue, blueSliderValue: $blueSliderValue)
                    
                ColorSliderView(value: $redSliderValue, textColor: .red)
                ColorSliderView(value: $greenSliderValue, textColor: .green)
                ColorSliderView(value: $blueSliderValue, textColor: .blue)
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ColorSliderView: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack(spacing: 20){
            Text("\(lround (value))")
                    .lineLimit(1)
                    .scaledToFill()
                    
            Slider(value: $value, in: 0...250, step: 1)
                    .frame(width: 290)
                    .accentColor(textColor)
            Text("\(lround (value))")
                    .lineLimit(1)
                    .scaledToFill()
                    
            }
        
        .padding()
    }
}

struct RoundedRectangleView: View {
    @Binding var redSliderValue: Double
    @Binding var greenSliderValue: Double
    @Binding var blueSliderValue: Double
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 350,height: 150)
            .foregroundColor(Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255))
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 4))
    }
}
