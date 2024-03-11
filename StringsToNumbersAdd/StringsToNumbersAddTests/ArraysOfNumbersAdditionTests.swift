//
//  ArraysOfNumbersAddition.swift
//  StringsToNumbersAddTests
//
//  Created by Sinuar on 22/02/24.
//

import XCTest
@testable import StringsToNumbersAdd

final class ArraysOfNumbersAdditionTests: XCTestCase {
    
    func testSomething() {
        let firstArrayStub = [3]
        let secondArrayStub = [5]
        let expectedValue = 3+5
        
        let subject = ArraysOfNumbersAdditionViewModel()
        
        let output: Int = subject.numbersAddition(firstArray: firstArrayStub, secondArray: secondArrayStub)
        
        XCTAssertEqual(expectedValue, output)
        
    }

}
