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
        print(Calculator.add(numbers: str))
    }
}
