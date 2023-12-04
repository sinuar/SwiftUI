//
//  DateLayout.swift
//  CalendarPicker
//
//  Created by Sinuhé Ruedas on 23/05/23.
//

import Foundation

enum DateLayout {
    case single(model: DateViewModel)
    case horizontal(startDate: DateViewModel, endDate: DateViewModel)
    case vertical(startDate: DateViewModel, endDate: DateViewModel)
}

