//
//  KeyboardLetterKey.swift
//  Swordle
//
//  Created by Adam Price on 21/01/2022.
//

import SwiftUI
import SwordleModel

struct KeyboardLetterKey: View {
    
    let character: String
    var evaluation: Evaluation? = nil
    
    init(character: String, evaluation: Evaluation? = nil) {
        self.character = character
        self.evaluation = evaluation
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .fill(backgroundColor)
            Text(character)
                .foregroundColor(Color("KeyboardTextColor"))
                .fontWeight(.bold)
        }
        .frame(maxWidth: 43, maxHeight: 58, alignment: .center)
    }
    
    var backgroundColor: Color {
        switch evaluation {
        case .correct:
            return Color("Correct")
        case .present:
            return Color("Present")
        case .absent:
            return Color("Absent")
        case .none:
            return Color("KeyboardBackgroundColor")
        }
    }
}

struct KeyboardLetterKey_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardLetterKey(character: "Q")
    }
}
