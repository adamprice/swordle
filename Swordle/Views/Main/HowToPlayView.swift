//
//  HowToPlay.swift
//  Swordle
//
//  Created by Adam Price on 27/01/2022.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(
                """
                Guess the **WORDLE** in 6 tries.
                
                Each guess must be a valid 5 letter word. Hit the enter button to submit.
                
                After each guess, the color of the tiles will change to show how close your guess was to the word.
                """
                )
                Divider()
                VStack(alignment: .leading) {
                    Text("**Examples**")
                    WordRow(word: "WEARY", evaluations: [.correct, .none, .none, .none, .none])
                    Text("The letter **W** is in the word and in the correct spot.")
                    WordRow(word: "PILLS", evaluations: [.none, .present, .none, .none, .none])
                    Text("The letter **I** is in the word but in the wrong spot.")
                    WordRow(word: "VAGUE", evaluations: [.none, .none, .none, .absent, .none])
                    Text("The letter **U** is not in the word in any spot.")
                }
                Divider()
                Text("**A new WORDLE will be available each day!**")
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("How to Play")
            .background(.background)
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
            .preferredColorScheme(.dark)
    }
}
