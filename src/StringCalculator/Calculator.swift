//
//  Calculator.swift
//  StringCalculator
//
//  Created by Giovane Cavalcante on 14/06/22.
//

import Foundation

struct Calculator {
    static func add(numbers: String) -> Int {
        let cleanNumbers = numbers.replacingOccurrences(of: "\n", with: "")
        return cleanNumbers.split(separator: ",").reduce(0) { partialResult, number in
            partialResult + (Int(number) ?? 0)
        }
    }
}
