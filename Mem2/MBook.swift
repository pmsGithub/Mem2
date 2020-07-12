//
//  MMemory.swift
//  Mem2
//
//  Created by Paul M Sweazey on 2020.07.10.
//  Copyright © 2020 Paul M Sweazey. All rights reserved.
//


/*
When a book is first instantiated, it contains a single Sentence of Category 'title',
containing one Atom that holds the german string "Untitled".

The next action is to add another sentence, perhaps initially an 'author' Sentence
that contains the author's name

Thereafter, Sentences of type 'text' are typically added with the 'german' property loaded.

There is generally no need to instantiate an empty container, and so identifier(id) values
can be inferred from the current context and made both unique and appropriate.
*/

import Foundation

enum SentenceCategory {
    case title, author
    case text
    case chapterHeading, paragraphBreak, largeParagraphBreak, Annotation
}

struct Book {
    var sentences: [Sentence]
    var idOfSentenceWithFocus: Int = 0
    
    //    mutating func insertSentenceUsingGermanStrings(germanStrings: [String], at position: Int) {
    //        let sentenceToInsert = Sentence(germanStrings: germanStrings)
    //        sentences.insert(sentenceToInsert, at: idOfSentenceWithFocus)
    //    }
    //
    //    mutating func removeSentenceFromBook(sentencePosition: Int) {
    //        sentences.remove(at: sentencePosition)
    //    }
    
    init(titleSentence: Sentence) {
        sentences = [Sentence](arrayLiteral: titleSentence)
        print("sentences: \(sentences)")
    }
}

struct Sentence: Identifiable {
    var atoms: [Atom]
    var hasFocus: Bool = false
    let sentenceCategory: SentenceCategory
    var id: Int
    
//    init(germanStrings: [String], number: Int) {
//        atoms = atomsArrayFromGermanStrings(germanStrings: germanStrings)
//        sentenceCategory = SentenceCategory.text
//        id = number
//    }
    
    // Initialize first sentence of book with first atom of sentence
    init(titleAtom: Atom) {
        atoms = [Atom](arrayLiteral: titleAtom)
        sentenceCategory = SentenceCategory.title
        id = 0
    }
    
//    init(germanAtoms: [Atom], position: Int) {
//        atoms = germanAtoms
//        sentenceCategory = SentenceCategory.text
//        id = position
//    }
}

struct Atom: Identifiable {
    var german: String
    var yoda: String
    var id: Int
    
    var pos = PartOfSpeech.tbd
    var isChosen = false
    var isHighlighted = false
    var groups: [Atom]? = nil
    
    enum PartOfSpeech {
        case preposition, conjunction, punctuation, other
        case noun, pronoun, article, adjective, prepArticle, particle
        case vPrefix, vBase, vConjugated, vInfinitive, vAuxHelping, vModal, vPastPart, vPresentPart, adverb
        case tbd, na
    }
    
    init(titleGerman: String, titleYoda: String) {
        german = titleGerman
        yoda = titleYoda
        pos = PartOfSpeech.na
        id = 0
    }
    
    init(germanWord: String) {
        german = germanWord
        yoda = ""
        pos = PartOfSpeech.tbd
        id = 0
    }
    
    func chooseAtom(atom: Atom) {
        print("atom chosen: \(atom)")
    }
}

func sentenceArrayFromAtomsArray() { }

func bookFromSentenceArray() { }

func atomsArrayFromGermanStrings(germanStrings: [String]) -> [Atom] {
    var aboms = [Atom]()
    for i in 0 ..< germanStrings.count {
        aboms.append(Atom(germanWord: germanStrings[i]))
    }
    return aboms
}

//func makeSentencesfromOneString(aString: String) -> [Sentence] {
//    let anAtom: Atom = Atom(firstGermanWord: "Ich")
//    let aSentence: Sentence = Sentence(firstAtom: anAtom)
//    var aSentenceArray: [Sentence] = [aSentence]
//    aSentenceArray.append(aSentence)
//    return aSentenceArray
//}
