//
//  Concentration.swift
//  concentraion
//
//  Created by Дмитрий Пермяков on 11.10.2022.
//

import Foundation

class ConcebtraionGame {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].indefier == cards[index].indefier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceup = false
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCard: Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
        }
        
    
        
    }
    
    
}
