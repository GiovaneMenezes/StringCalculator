//
//  main.swift
//  StringCalculator
//
//  Created by Giovane Cavalcante on 14/06/22.
//

import Foundation

while true {
    print("Insert the string:")
    if let str = readLine() {
        let preparedString = str.replacingOccurrences(of: "\\n", with: "\n")
        print(try Calculator.add(numbers: preparedString))
    }
    print("\n")
}
