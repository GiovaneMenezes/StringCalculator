//
//  Calculator.swift
//  StringCalculator
//
//  Created by Giovane Cavalcante on 14/06/22.
//

import Foundation

struct Calculator {
    static func add(numbers: String) -> Int {
        numbers.split(separator: ",").reduce(0) { partialResult, number in
            partialResult + (Int(number) ?? 0)
        }
    }
}
