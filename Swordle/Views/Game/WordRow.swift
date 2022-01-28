//
//  WordRow.swift
//  Swordle
//
//  Created by Adam Price on 21/01/2022.
//

import SwiftUI
import SwordleModel

struct WordRow: View {
    
    var word: [String]
    var evaluations: [Evaluation?] = []
    
    init(word: String? = nil,
         evaluations: [Evaluation?] = []) {
        self.word = word?.map { String($0) } ?? []
        self.evaluations = evaluations
    }
    
    var body: some View {
        HStack(spacing: 5) {
            if word.count == 5 && evaluations.count == 5 {
                ForEach((0..<word.count), id: \.self) {
                    CharacterTile(character: word[$0], evaluation: evaluations[$0])
                }
            } else {
                ForEach((0..<5), id: \.self) { _ in
                    CharacterTile(character: "")
                }
            }
        }
    }
}

struct WordRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                WordRow(word: "AHHED",
                        evaluations: [.absent, .absent, .absent, .absent, .absent])
                WordRow(word: "SMACK",
                        evaluations: [.absent, .absent, .absent, .correct, .correct])
                WordRow(word: "PUPPY",
                        evaluations: [.correct, .absent, .absent, .absent, .absent])
                WordRow(word: "UPSET",
                        evaluations: [.absent, .present, .absent, .absent, .absent])
                WordRow(word: "PRICK",
                        evaluations: [.correct, .correct, .correct, .correct, .correct])
                WordRow()
            }
            .padding()
            .navigationBarTitle("Swordle")
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(.dark)
    }
}
