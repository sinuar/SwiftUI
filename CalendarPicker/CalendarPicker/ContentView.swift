//
//  ContentView.swift
//  CalendarPicker
//
//  Created by Sinuhé Ruedas on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DateSelectorBox(textOne: "Un primer texto", textTwo: "Un segundo y mayor texto")
            DateSelectorBox(textOne: "Date", textTwo: "Date numbers")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
