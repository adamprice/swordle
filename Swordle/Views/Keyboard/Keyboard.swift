//
//  Keyboard.swift
//  Swordle
//
//  Created by Adam Price on 21/01/2022.
//

import SwiftUI
import SwordleModel

struct Keyboard: View {
    
    var keyState: [String: Evaluation] = [
        "K": .correct
    ]
    
    var body: some View {
        VStack {
            HStack(spacing: 6) {
                KeyboardLetterKey(character: "Q")
                KeyboardLetterKey(character: "W")
                KeyboardLetterKey(character: "E", evaluation: keyState["E"])
                KeyboardLetterKey(character: "R")
                KeyboardLetterKey(character: "T", evaluation: .absent)
                KeyboardLetterKey(character: "Y", evaluation: .absent)
                KeyboardLetterKey(character: "U", evaluation: .absent)
                KeyboardLetterKey(character: "I")
                KeyboardLetterKey(character: "O")
                KeyboardLetterKey(character: "P", evaluation: .correct)
            }
            HStack(spacing: 6) {
                KeyboardLetterKey(character: "A", evaluation: .absent)
                KeyboardLetterKey(character: "S", evaluation: .absent)
                KeyboardLetterKey(character: "D", evaluation: .absent)
                KeyboardLetterKey(character: "F")
                KeyboardLetterKey(character: "G")
                KeyboardLetterKey(character: "H", evaluation: .absent)
                KeyboardLetterKey(character: "J")
                KeyboardLetterKey(character: "K", evaluation: keyState["K"])
                KeyboardLetterKey(character: "L")
            }
            .padding([.leading, .trailing])
            HStack(spacing: 6) {
                KeyboardActionKey(action: "\(Image(systemName: "return.left"))")
                HStack(spacing: 6) {
                    KeyboardLetterKey(character: "Z")
                    KeyboardLetterKey(character: "X")
                    KeyboardLetterKey(character: "C", evaluation: .correct)
                    KeyboardLetterKey(character: "V")
                    KeyboardLetterKey(character: "B")
                    KeyboardLetterKey(character: "N")
                    KeyboardLetterKey(character: "M", evaluation: .absent)
                }
                .layoutPriority(1)
                KeyboardActionKey(action: "\(Image(systemName: "delete.backward"))")
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
    }
}
