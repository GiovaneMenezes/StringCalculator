//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Giovane Cavalcante on 14/06/22.
//

import XCTest
//@testable import StringCalculator

class StringCalculatorTests: XCTestCase {

    func test_addFunction_stringWithNoCustomDelimiter() {
        XCTAssertEqual(Calculator.add(numbers: ""), 0, "Should return 0 for empty strings")
        XCTAssertEqual(Calculator.add(numbers: "1,2,5"), 8)
        XCTAssertEqual(Calculator.add(numbers: "1\n,2,3"), 6)
        XCTAssertEqual(Calculator.add(numbers: "1,\n2,4"), 7)
    }
    
    func test_addFunction_stringWithCustomDelimiter() {
        XCTAssertEqual(Calculator.add(numbers: "//;\n1;3;4"), 8)
        XCTAssertEqual(Calculator.add(numbers: "//$\n1$2$3"), 6)
        XCTAssertEqual(Calculator.add(numbers: "//@\n2@3@8"), 13)
    }
}
