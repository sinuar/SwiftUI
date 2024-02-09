//
//  ContentView.swift
//  StateExercise01
//
//  Created by Sinuar on 09/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counterRed = 0
    @State private var counterGreen = 0
    @State private var counterCyan = 0
    
    var body: some View {
        VStack {
            Text("Total count: \n \(counterRed + counterGreen + counterCyan)")
                .font(.system(size: 46))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
        .padding()
        Text("Tap to increase count")
        HStack {
            CounterButton(tapCounter: $counterRed, color: .red)
            CounterButton(tapCounter: $counterGreen, color: .green)
            CounterButton(tapCounter: $counterCyan, color: .cyan)
        }
    }
}

struct CounterButton: View {
    @Binding var tapCounter: Int
    var color: Color
    
    var body: some View {
        VStack {
            Button(action: {
                // Increase count when tapped
                self.tapCounter += 1
            }) {
                Circle()
                    .frame(width: 90, height: 90)
                    .foregroundColor(color)
                    .overlay(
                        Text("\(tapCounter)")
                            .font(.system(size: 56, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    )
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
