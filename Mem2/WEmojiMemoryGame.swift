//
//  WEmojiMemory.swift
//  Mem2
//
//  Created by Paul M Sweazey on 2020.07.10.
//  Copyright © 2020 Paul M Sweazey. All rights reserved.
//

import SwiftUI

//func createCardContent(pairIndex: Int) -> String {
//    return "🌱"
//}

class EmojiMemoryGame {
//    private var model: MemoryGame<String> =
//        MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { (pairIndex: Int) -> String in return "🌱" })
//        MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: {  pairIndex       -> String in        "🌱" })
//        MemoryGame<String>(numberOfPairsOfCards: 2)                     {  pairIndex       -> String in        "🌱" }
//        MemoryGame<String>(numberOfPairsOfCards: 2)                     {  _               -> String in        "🌱" }

//    private var model: MemoryGame<String> = createMemoryGame()
// When you make'createMemoryGame()' static (a class function), then you must use its class.func name form
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
//    Make the function static to avoid the following error…
//    Cannot use instance member 'createMemoryGame' within property initializer; property initializers run before 'self' is available
    static func createMemoryGame() -> MemoryGame<String> {
//        let emojis: Array<String> = ["👻", "🎃"]
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    // This is computed var, containing only an implicit 'get' clause, with an implied 'return' keyword.
    // Thus, 'cards' is a read-only var that, when read, will return the current state of the array of cards in the Model.
    // Since 'CardContent' is really 'String', model.cards[i].content is of type 'String' and can hold an emoji string.
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intents
    
    // Anybody wanting to run 'choose' in the Model must do it by running this 'choose' in the ViewModel
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
