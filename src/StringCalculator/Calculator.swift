//
//  Calculator.swift
//  StringCalculator
//
//  Created by Giovane Cavalcante on 14/06/22.
//

import Foundation

struct Calculator {
    
    private enum CalculatorError: LocalizedError {
        case negativesNotAllowed([Int])
        
        var errorDescription: String? {
            switch self {
            case let .negativesNotAllowed(values):
                return "Negatives not allowed: \(values)"
            }
        }
    }
    
    private static func splitNumbersString(numbers: String) -> (separators: [String], numbers: String) {
        if numbers.hasPrefix("//") {
            let prefixRange = numbers.startIndex..<numbers.index(numbers.startIndex, offsetBy: 2)
            let numbersWithNoPrefix = numbers.replacingOccurrences(of: "/",
                                                                   with: "",
                                                                   range: prefixRange)
            let stringComponents = numbersWithNoPrefix.split(separator: "\n", maxSplits: 1)
            let separators = stringComponents[0].split(separator: ",").map { String($0) }
            return (separators, String(stringComponents[1]))
        } else {
            return ([","], numbers)
        }
    }
    
    private static func verifyNegativeElements(array: [Int]) throws {
        let negativeElements = array.filter( { $0 < 0 } )
        if !negativeElements.isEmpty {
            throw CalculatorError.negativesNotAllowed(negativeElements)
        }
    }
    
    static func add(numbers: String) throws -> Int {
        let (separators, numbers) = splitNumbersString(numbers: numbers)
        var cleanNumbers = numbers.replacingOccurrences(of: "\n", with: "")
        separators.forEach { separator in
            cleanNumbers = cleanNumbers.replacingOccurrences(of: separator, with: ",")
        }
        let numbersIntArray = cleanNumbers
            .components(separatedBy: ",")
            .map( { Int($0) ?? 0 } )
            .filter( { $0 <= 1000 } )
        try verifyNegativeElements(array: numbersIntArray)
        return numbersIntArray.reduce(0, { $0 + $1})
    }
}
