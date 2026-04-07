//
//  NewProfileView.swift
//  FeatureFlagsDemo
//
//  Created by Sinuar on 05/03/26.
//

import SwiftUI

struct NewProfileView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(Color.blue)
            Text("John Appleseed")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Senior iOS Developer")
                .foregroundStyle(.secondary)
            
            Button("Follow") {
                print("Follow tapped")
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    NewProfileView()
}
