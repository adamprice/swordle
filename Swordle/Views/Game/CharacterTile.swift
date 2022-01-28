//
//  CharacterTile.swift
//  Swordle
//
//  Created by Adam Price on 21/01/2022.
//

import SwiftUI
import SwordleModel

struct CharacterTile: View {
    
    @State var flipped = false

    var character: String = ""
    private(set) var evaluation: Evaluation? = nil
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(backgroundColor)
                .border(borderColor, width: 2)
                .aspectRatio(1.0, contentMode: .fit)
            Text(character)
                .foregroundColor(textColor)
                .fontWeight(.bold)
                .font(.largeTitle)
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .lineLimit(1)
        }
        .frame(alignment: .center)
        .rotation3DEffect(self.flipped ? Angle(degrees: -180): Angle(degrees: 0),
                          axis: (x: CGFloat(10), y: CGFloat(0), z: CGFloat(0)))
        .onTapGesture {
            self.flipped.toggle()
        }
    }
    
    private var textColor: Color {
        switch evaluation {
        case .correct, .present, .absent:
            return .white
        default:
            return Color("TextColor")
        }
    }
    
    private var borderColor: Color {
        switch evaluation {
        case .correct:
            return Color("Correct")
        case .present:
            return Color("Present")
        case .absent:
            return Color("Absent")
        case .none where character.isEmpty == false:
            return Color("Unsubmitted")
        default:
            return Color("Empty")
        }
    }
    
    private var backgroundColor: Color {
        switch evaluation {
        case .correct:
            return Color("Correct")
        case .present:
            return Color("Present")
        case .absent:
            return Color("Absent")
        case .none where character.isEmpty == false:
            return Color("UnconfirmedTileBackground")
        default:
            return Color("EmptyTileBackground")
        }
    }
    
    init(character: String,
         evaluation: Evaluation? = nil) {
        self.character = character
        self.evaluation = evaluation
    }

}

struct CharacterTile_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CharacterTile(character: "P",
                          evaluation: .correct)
            CharacterTile(character: "R",
                          evaluation: .present)
            CharacterTile(character: "I",
                          evaluation: .absent)
            CharacterTile(character: "",
                          evaluation: .none)
            CharacterTile(character: "K",
                          evaluation: .none)
        }
        .padding()
        .preferredColorScheme(.dark)
    }
}
