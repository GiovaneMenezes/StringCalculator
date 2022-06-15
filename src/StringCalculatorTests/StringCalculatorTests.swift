//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Giovane Cavalcante on 14/06/22.
//

import XCTest
//@testable import StringCalculator

class StringCalculatorTests: XCTestCase {

    func test_addFunction_stringWithNoCustomDelimiter() throws {
        XCTAssertEqual(try Calculator.add(numbers: ""), 0, "Should return 0 for empty strings")
        XCTAssertEqual(try Calculator.add(numbers: "1,2,5"), 8)
        XCTAssertEqual(try Calculator.add(numbers: "1\n,2,3"), 6)
        XCTAssertEqual(try Calculator.add(numbers: "1,\n2,4"), 7)
    }
    
    func test_addFunction_stringWithCustomDelimiter() throws {
        XCTAssertEqual(try Calculator.add(numbers: "//;\n1;3;4"), 8)
        XCTAssertEqual(try Calculator.add(numbers: "//$\n1$2$3"), 6)
        XCTAssertEqual(try Calculator.add(numbers: "//@\n2@3@8"), 13)
    }
    
    func test_addFunction_negativeNumbersAreNotAllowed() throws {
        testLocalizableError(
            try Calculator.add(numbers: "-1,2,5"),
            errorMessage: "Negatives not allowed: [-1]"
        )
        testLocalizableError(
            try Calculator.add(numbers: "//;\n1;3;-4"),
            errorMessage: "Negatives not allowed: [-4]"
        )
        testLocalizableError(
            try Calculator.add(numbers: "//;\n-1;-3;-4"),
            errorMessage: "Negatives not allowed: [-1, -3, -4]"
        )
    }
}

extension StringCalculatorTests {
    func testLocalizableError<T>(
        _ expression: @autoclosure () throws -> T,
        errorMessage: String,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        do {
            _ = try expression()
        } catch {
            XCTAssertEqual(
                error.localizedDescription,
                errorMessage,
                file: file,
                line: line
            )
            return
        }
        XCTFail("Should return a error.", file: file, line: line)
    }
}
