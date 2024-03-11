//
//  StringsToNumbersAddViewModel.swift
//  StringsToNumbersAdd
//
//  Created by Sinuar on 22/02/24.
//

import Foundation

class StringsToNumbersAddViewModel {
    func stringsToNumbers(firstArray: [String], secondArray: [String]) -> Int {
        let number1 = Int(firstArray.joined()) ?? 0
        let number2 = Int(secondArray.joined()) ?? 0
        
        let result = number1 + number2
        
        return result
    }
}
