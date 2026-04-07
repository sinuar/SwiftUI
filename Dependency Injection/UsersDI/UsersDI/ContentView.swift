//
//  ContentView.swift
//  UsersDI
//
//  Created by Sinuar on 06/02/26.
//
// Module 1 — Baseline App (NO Dependency Injection)

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
