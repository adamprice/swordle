//
//  Header.swift
//  Swordle
//
//  Created by Adam Price on 27/01/2022.
//

import SwiftUI

struct Header: View {
    
    @State private var showingHowToPlay = false
    @State private var showingSettings = false
    @State private var showingStatistics = false
    
    var body: some View {
        HStack(spacing: 0) {
            HStack {
                Button {
                    showingHowToPlay.toggle()
                } label: {
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(.primary)
                }
                .sheet(isPresented: $showingHowToPlay) {
                    HowToPlayView()
                }
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)

            Text("\(Image(systemName: "swift")) Swordle")
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity)

            HStack {
                Spacer()
                Button {
                    showingStatistics.toggle()
                } label: {
                    Image(systemName: "chart.bar.xaxis")
                        .foregroundColor(.primary)
                }
                .sheet(isPresented: $showingStatistics) {
                    StatisticsView()
                }
                Button {
                    showingSettings.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.primary)
                }
                .sheet(isPresented: $showingSettings) {
                    SettingsView()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
