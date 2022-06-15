//
//  main.swift
//  StringCalculator
//
//  Created by Giovane Cavalcante on 14/06/22.
//

import Foundation

while true {
    print("Insert the number of lines:")
    
    guard let numberOfLinesString = readLine(),
            let numberOfLines = Int(numberOfLinesString) else { continue }
    
    print("Insert the string:")
    
    var stringLines = [String]()
    
    for _ in 0..<numberOfLines {
        if let str = readLine() {
            stringLines.append(str)
        }
    }
    
    print("The complete string is:\n\(stringLines.joined(separator: "\\n"))\n")
    print("The result is:")
    print(try Calculator.add(numbers: stringLines.joined(separator: "\n")))
    print("\n\n\n\n")
}
