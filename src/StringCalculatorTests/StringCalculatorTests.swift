//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Giovane Cavalcante on 14/06/22.
//

import XCTest
//@testable import StringCalculator

class StringCalculatorTests: XCTestCase {

    func test_addFunction() {
        XCTAssertEqual(Calculator.add(numbers: ""), 0, "Should return 0 for empty strings")
        XCTAssertEqual(Calculator.add(numbers: "1,2,5"), 8)
    }
}
