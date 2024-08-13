//
//  String+.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 25/07/24.
//

import Foundation

extension String {
    func formatDigits(mask: String) -> String {
        let cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

        var result = ""
        var startIndex = cleanNumber.startIndex
        let endIndex = cleanNumber.endIndex

        for char in mask where startIndex < endIndex {
            if char == "X" {
                result.append(cleanNumber[startIndex])
                startIndex = cleanNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }

        return result
    }
}
