//
//  SettingsView.swift
//  Swordle
//
//  Created by Adam Price on 27/01/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @State var hardModeEnabled: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Toggle("Hard Mode", isOn: $hardModeEnabled)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
