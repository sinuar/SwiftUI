//
//  DatePicker.swift
//  CalendarPicker
//
//  Created by Sinuhé Ruedas on 22/05/23.
//

import SwiftUI

struct DatePicker: View {
    var layout: DateLayout
    
    var body: some View {
        VStack {
            AnyView(build(layout))
                .padding()
            Button {
                print("Boton")
            } label: {
                Text("Tap Me")
            }
        }
    }
    
    private func build(_ layout: DateLayout) -> any View {
        switch layout {
        case let .single(model):
            return VStack {
                DateSelectorBox(viewModel: model)
            }
        case let .horizontal(startDate, endDate):
            return HStack {
                DateSelectorBox(viewModel: startDate)
                DateSelectorBox(viewModel: endDate)
            }
        case let .vertical(startDate, endDate):
            return VStack {
                DateSelectorBox(viewModel: startDate)
                DateSelectorBox(viewModel: endDate)
            }
        }
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker(
            layout: .vertical(
                startDate: DateViewModel(
                    iconName: "",
                    title: "",
                    date: ""
                ),
                endDate: DateViewModel(
                    iconName: "",
                    title: "",
                    date: "")
            )
        )
    }
}
