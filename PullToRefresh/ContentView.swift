//
//  ContentView.swift
//  PullToRefresh
//
//  Created by Sinuhé Ruedas on 24/07/23.
//

import SwiftUI


struct ContentView: View {
    var lazy: Bool = false
    var someText = "ESte es un parrafo de muchas cosas"
    
    @State private var isLoading = false
    var body: some View {
        RefreshableScrollView(action: refreshList) {
            if isLoading {
                VStack {
                    Color.red
                }
            }
            if lazy {
                LazyVStack {
                    Text(someText)
                }
            } else {
                VStack {
                    Text("Mas texto")
                    Text("Mas texto")

                }
            }
        }
    }
        
    private func refreshList() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isLoading = false
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
