//
//  KeyboardActionKey.swift
//  Swordle
//
//  Created by Adam Price on 21/01/2022.
//

import SwiftUI

struct KeyboardActionKey: View {
    
    let action: LocalizedStringKey

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .fill(Color("KeyboardBackgroundColor"))
            Text(action)
                .foregroundColor(Color("KeyboardTextColor"))
                .fontWeight(.bold)
        }
        .frame(minWidth: 50, maxWidth: 65, maxHeight: 58, alignment: .center)
    }
}

struct KeyboardActionKey_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardActionKey(action: "\(Image(systemName: "delete.backward"))")
    }
}
