//
//  StatisticsView.swift
//  Swordle
//
//  Created by Adam Price on 27/01/2022.
//

import SwiftUI

struct StatisticsView: View {
    
    @State var timeUntilNextPuzzle: String = ""
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            Text("\(timeUntilNextPuzzle)")
                .onReceive(timer) { input in
                    let components = DateComponents(calendar: Calendar.current, hour: 0)
                    let next5pm = Calendar.current.nextDate(after: .now,
                                                            matching: components,
                                                            matchingPolicy: .nextTime)!
                    let diff = Calendar.current.dateComponents([.hour, .minute, .second],
                                                               from: .now,
                                                               to: next5pm)
                    timeUntilNextPuzzle = "\(diff.hour!):\(diff.minute!):\(diff.second!)"
                }
            .navigationTitle("Statistics")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
