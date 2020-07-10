//
//  MMemory.swift
//  Mem2
//
//  Created by Paul M Sweazey on 2020.07.10.
//  Copyright © 2020 Paul M Sweazey. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
//            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
//            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
// Add 'id' and remove 'isFfaceUp' and 'isMatched', initializing them by default in the struct declaration below.
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
//    struct Card {
// To make the cards 'identifiable' I must declare it, and also add a var named 'id'
//   and add 'id' to the initializer function above.
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
