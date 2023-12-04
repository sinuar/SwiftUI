//
//  ContentView.swift
//  CalendarPicker
//
//  Created by Sinuhé Ruedas on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    @ViewBuilder
    var singleView: some View {
        Section {
            DatePicker(
                layout: .single(
                    model: DateViewModel(
                        iconName: "calendar",
                        title: "Fecha inicio",
                        date: "12 Enero"
                    )
                )
            )
        } header: {
            Text("Sencillo")
        }
    }
    
    @ViewBuilder
    var horizontalView: some View {
        Section {
            DatePicker(
                layout: .horizontal(
                    startDate: DateViewModel(
                        iconName: "calendar",
                        title: "Fecha inicio",
                        date: "12 Enero"
                    ),
                    endDate: DateViewModel(
                        iconName: "calendar",
                        title: "Fecha final",
                        date: "17 enero"
                    )
                )
            )
        } header: {
            Text("Horizontal")
        }
    }
    
    @ViewBuilder
    var verticalView: some View {
        Section {
            DatePicker(
                layout: .vertical(
                    startDate: DateViewModel(
                        iconName: "calendar",
                        title: "Fecha inicio",
                        date: "12 Enero"
                    ),
                    endDate: DateViewModel(
                        iconName: "calendar",
                        title: "Fecha final",
                        date: "17 enero"
                    )
                )
            )
        } header: {
            Text("Vertical")
        }
    }
    
    var body: some View {
        VStack {
            singleView
            Divider()
            horizontalView
            Divider()
            verticalView
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
