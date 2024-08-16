//
//  RandomDigitSequnce.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 11.08.2024.
//

import Foundation

struct RandomDigitSequence: Sequence, IteratorProtocol {
    private let length: Int
    private var currentCount: Int
    
    init(length: Int) {
        self.length = length
        self.currentCount = 0
    }
    
    mutating func next() -> String? {
        guard currentCount < length else {
            return nil
        }
        currentCount += 1
        return String(Int.random(in: 0...9))
    }
}
