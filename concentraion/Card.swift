//
//  Card.swift
//  concentraion
//
//  Created by Дмитрий Пермяков on 11.10.2022.
//

import Foundation

struct Card {
    var isFaceup = false
    var isMatched = false
    var indefier = Int()
    static var indefierNumber = 0
    
    static func indefierGenerator() -> Int {
        indefierNumber += 1
        return indefierNumber
    }
    
    init() {
        self.indefier = Card.indefierGenerator()
    }
}
