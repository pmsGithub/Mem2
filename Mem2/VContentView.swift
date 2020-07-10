//
//  ContentView.swift
//  Mem2
//
//  Created by Paul M Sweazey on 2020.07.10.
//  Copyright © 2020 Paul M Sweazey. All rights reserved.
//
// Lesson 2: 1:29:40

import SwiftUI

// This struct creates a View to show on the Canvas
// See Stanford CS193p 2020 lesson 2: 1:30:44
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    
// This is the Initializer call before we added 'var viewModel' to the 'ContentView' struct
//        ContentView()

// Initializer call…
// This is where we instantiate our version of a View for preview on the Canvas
        ContentView(viewModel: EmojiMemoryGame())
        // Note: The ContentView init() is being passed the return value from the init() of EmojiMemoryGame.
    }
}

// Where is the following struct instantiated for the rootView… the user's display? In the SceneDelegate.
// Where is it instantiated for the Canvase preview? Just above this comment.
        // (By conforming to 'View' protocol, we must provide a 'body' var that holds the definition of what gets rendered.)
struct ContentView: View {
    // connect to VM class by reference by refering to 'viewModel'
    var viewModel: EmojiMemoryGame

    var body: some View {
        HStack {
            // ForEach() requires an identifiable value range.
//            ForEach(0..<4) { index in
//                CardView(isFaceUp: true)
            ForEach(viewModel.cards) { card in
//                CardView(card: card)
//              Add 'choose()' here
//                CardView(card: card).onTapGesture(perform: { viewModel.choose(card: card) })
                CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
                
                }
                // This is where data from M, through VM, reaches V.
            }
        }
        .padding()
            // 'orange' is a var of the Type 'Color', not of some instance of 'color' — thus the uppercase.
            // Same for the 'largeTitle' var of the Type 'Font'.
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}
 
struct CardView: View {
    // var isFaceUp: Bool
    
    // We replace the dummy var 'isFaceUp' with a reference to the truth (M), but through VM (=W)
    // Instead we add 'var card', which comes from VM above, when the 'CardView' instance is born
    //   above in the 'ForEach' struct.
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            // if isFaceUp {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                //                Text("A")
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

