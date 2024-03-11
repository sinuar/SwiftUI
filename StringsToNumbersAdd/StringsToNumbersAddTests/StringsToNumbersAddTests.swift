//
//  StringsToNumbersAddTests.swift
//  StringsToNumbersAddTests
//
//  Created by Sinuar on 22/02/24.
//

import XCTest
@testable import StringsToNumbersAdd

final class StringsToNumbersAddTests: XCTestCase {

    func testAdditionOfNumbersAsStrings() {
        let firstArrayStub = ["2", "4"]
        let secondArrayStub = ["3"]
        let expectedValue = 24+3

        let subject = StringsToNumbersAddViewModel()
        
        let output: Int = subject.stringsToNumbers(firstArray: firstArrayStub, secondArray: secondArrayStub)
        
        XCTAssertEqual(expectedValue, output)
    }
    
    func testStringsToNumbersReturnsZeroWhenNoNumericString() {
        let firstArrayStub = ["s", "x"]
        let expectedValue = 0
        let secondArrayStub = ["3"]
        let subject = StringsToNumbersAddViewModel()
        
        let output: Int = subject.stringsToNumbers(firstArray: firstArrayStub, secondArray: secondArrayStub)
        
        XCTAssertEqual(expectedValue, output)
    }
}
