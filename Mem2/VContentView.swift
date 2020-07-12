//
//  ContentView.swift
//  Mem2
//
//  Created by Paul M Sweazey on 2020.07.10.
//  Copyright © 2020 Paul M Sweazey. All rights reserved.
//
// Lesson 2: 1:29:40

import SwiftUI

// This struct instantiates a View to show on the Canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: Reader())
    }
}

// This struct instantiates a View for display on the device or in the simulator
struct ContentView: View {
    var viewModel: Reader

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            SentenceView()
            
        }
    }
}
 
struct SentenceView: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline ) {
            Text("Experiment: ")
            ForEach ( 0 ..< germanStrings.count ) { item in
                Text(germanStrings[item])
                    .font(.largeTitle) .bold() .background(Color.blue) .opacity(0.5)
                    .onTapGesture(count: 2) { print("Double-tapped \(germanStrings[item])") }
                    .onTapGesture { print("Tapped \(germanStrings[item])") }
            }
        }
    }
}

