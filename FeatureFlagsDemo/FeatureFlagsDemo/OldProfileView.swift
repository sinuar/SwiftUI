//
//  OldProfileView.swift
//  FeatureFlagsDemo
//
//  Created by Sinuar on 05/03/26.
//

import SwiftUI

struct OldProfileView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            Text("John Appleseed")
                .font(.title)
            Text("iOS Developer")
                .foregroundStyle(.gray)
        }
        .padding()
    }
}

#Preview {
    OldProfileView()
}
