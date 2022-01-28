//
//  ContentView.swift
//  Swordle
//
//  Created by Adam Price on 21/01/2022.
//

import SwiftUI
import SwordleModel

struct ContentView: View {

    @StateObject var gameState = GameState(boardState: ["AHHED", "SMACK", "PUPPY", "UPSET"],
                                           evaluations: [[.absent, .absent, .absent, .absent, .absent],
                                                         [.absent, .absent, .absent, .correct, .correct],
                                                         [.correct, .absent, .absent, .absent, .absent],
                                                         [.absent, .present, .absent, .absent, .absent]],
                                           rowIndex: 4,
                                           solution: "PRICK",
                                           gameStatus: .inProgress,
                                           lastPlayed: .now,
                                           lastCompleted: .now,
                                           restoringFromUserDefaults: false,
                                           hardMode: false)

    var body: some View {
        VStack {
            Header()
            VStack(spacing: 5) {
                ForEach(0..<gameState.boardState.count, id: \.self) { index in
                    WordRow(word: gameState.boardState[index],
                            evaluations: gameState.evaluations[index])
                }
                ForEach(gameState.boardState.count..<6, id: \.self) { _ in
                    WordRow()
                }
            }
            .padding()
            Spacer()
            Keyboard()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
