//
//  ArraysOfNumbersAdditionViewModel.swift
//  StringsToNumbersAdd
//
//  Created by Sinuar on 22/02/24.
//

import Foundation

class ArraysOfNumbersAdditionViewModel {
    func numbersAddition(firstArray: [Int], secondArray: [Int]) -> Int {
        let firstNumber = joinIntegersFromArray(firstArray)
        let secondNumber = joinIntegersFromArray(secondArray)
        
        let result = firstNumber + secondNumber
        return result
    }
    
    private func joinIntegersFromArray(_ array: [Int]) -> Int {
        var number = 0
        
        for integer in array {
            number = number * 10 + integer
        }
        return number
    }
}
