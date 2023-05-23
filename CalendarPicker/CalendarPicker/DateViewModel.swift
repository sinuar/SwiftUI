//
//  DateViewModel.swift
//  CalendarPicker
//
//  Created by Sinuhé Ruedas on 23/05/23.
//

import Foundation

final class DateViewModel {
    let iconName: String
    let title: String
    let date: String
    
    init(iconName: String, title: String, date: String) {
        self.iconName = iconName
        self.title = title
        self.date = date
    }
}
