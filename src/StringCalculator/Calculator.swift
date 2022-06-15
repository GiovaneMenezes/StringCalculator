//
//  Calculator.swift
//  StringCalculator
//
//  Created by Giovane Cavalcante on 14/06/22.
//

import Foundation

struct Calculator {
    
    private static func splitNumbersString(numbers: String) -> (separator: Character?, numbers: String) {
        if numbers.hasPrefix("//") {
            let prefixRange = numbers.startIndex..<numbers.index(numbers.startIndex, offsetBy: 2)
            let numbersWithNoPrefix = numbers.replacingOccurrences(of: "/",
                                                                   with: "",
                                                                   range: prefixRange)
            let stringComponents = numbersWithNoPrefix.split(separator: "\n", maxSplits: 1)
            return (stringComponents[0].first, String(stringComponents[1]))
        } else {
            return (nil, numbers)
        }
    }
    
    static func add(numbers: String) -> Int {
        let (separator, numbers) = splitNumbersString(numbers: numbers)
        let cleanNumbers = numbers.replacingOccurrences(of: "\n", with: "")
        return cleanNumbers.split(separator: separator ?? ",").reduce(0) { partialResult, number in
            partialResult + (Int(number) ?? 0)
        }
    }
}
