//
//  DateViewModel.swift
//  CalendarPicker
//
//  Created by Sinuhé Ruedas on 23/05/23.
//

import Foundation
import Combine

protocol DatePresenter {
    var iconName: String { get }
    var title: String { get }
    var date: String { get set }
}

final class DateViewModel: ObservableObject, DatePresenter {
    let iconName: String
    let title: String
    @Published var date: String
    
    init(iconName: String, title: String, date: String) {
        self.iconName = iconName
        self.title = title
        self.date = date
    }
}
