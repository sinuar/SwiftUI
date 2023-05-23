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
            AnyView(build(.vertical))
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
        case .single:
            return VStack {
                DateSelectorBox(dateTitle: "date", dateText: "today")
            }
        case .horizontal:
            return HStack {
                DateSelectorBox(dateTitle: "date", dateText: "today")
                DateSelectorBox(dateTitle: "date", dateText: "thorizontaly")
            }
        default:
            return VStack {
                DateSelectorBox(dateTitle: "no Single", dateText: "lol")
                DateSelectorBox(dateTitle: "no Single", dateText: "vertical")
            }
        }
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker(layout: .single)
    }
}
