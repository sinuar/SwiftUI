//
//  ContentView.swift
//  TabViews
//
//  Created by Sinuhé Ruedas on 30/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                Text("Tab 1 content")
                    .tabItem {
                        Image(systemName: "1. circle")
                        Text("Tab 1")
                    }
                    .tag(0)
                
                Text("Tab 2 Content")
                    .tabItem {
                        Image(systemName: "2. circle")
                        Text("Tab 2")
                    }
                    .tag(1)
            }
            .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
