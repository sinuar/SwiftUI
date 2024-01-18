//
//  ContentView.swift
//  StickyBar_SwiftUI
//
//  Created by Sinuar on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            // Your content goes here
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Text("Item \(index)")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .overlay(StickyBar(), alignment: .top)
    }
}

struct StickyBar: View {
    var body: some View {
        VStack {
            // Your sticky bar content goes here
            Text("Sticky Bar")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
        }
        .background(GeometryReader { proxy in
            Color.clear
                .preference(key: ScrollOffsetKey.self, value: proxy.frame(in: .named("scrollView")).minY)
        })
        .onPreferenceChange(ScrollOffsetKey.self) { offset in
            print("Scroll Offset:", offset)
            // Handle the scroll offset here, and update the sticky bar position if needed
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    ContentView()
}
