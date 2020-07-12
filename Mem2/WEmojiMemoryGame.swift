//
//  WEmojiMemory.swift
//  Mem2
//
//  Created by Paul M Sweazey on 2020.07.10.
//  Copyright © 2020 Paul M Sweazey. All rights reserved.
//

import SwiftUI

let germanStrings: [String] = [
    "Er", "wollte", "es", "sich", "nicht", "eingestehen,",
    "aber", "er", "hatte", "Angst", "vor", "diesem", "Wasser,",
    "Angst", "vor", "dem,",
    "was", "sein", "Fuß", "da", "womöglich", "berührte,",
    "wenn", "er", "hindurchwartete,",
    "oder", "schlimmer", "noch,",
    "was", "um", "seine", "Beine", "streichen", "oder", "in", "seine", "Stiefel", "rinnen", "konnte."
]

class Reader {

// Instantiate M as a 'book', and make this var the portal to it.
//    Use 'germanStrings' to create a sentence consisting of an array of atoms
//    Use the sentence to create a 'book' consisting of just one sentence
//    private var book = Book(firstSentence: Sentence(germanStrings: germanStrings))
    private var book = Book(titleSentence: Sentence(titleAtom: Atom(titleGerman: "Kein_Titel", titleYoda: "Untitled")))
    
    
    // MARK: - Access to the Model
    
    // This is computed var, containing only an implicit 'get' clause, with an implied 'return' keyword.
    // Thus, 'sentences' is a read-only var that, when read, will return the current state of the array of sentences in the Model.
    var sentences: [Sentence] {
        book.sentences
    }
    
    var theBook: Book { book }
    
    //MARK: - Intents
    
    // Anybody wanting to run 'choose' in the Model must do it by running this 'choose' in the ViewModel
    func chooseAtom(sentenceID sID: Int, atomID aID: Int) {
        book.sentences[sID].atoms[aID].isChosen = true
    }
}
