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
            DatePicker(layout: .single)
            DatePicker(layout: .vertical)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
