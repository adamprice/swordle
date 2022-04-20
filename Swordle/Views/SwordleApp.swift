//
//  SwordleApp.swift
//  Swordle
//
//  Created by Adam Price on 21/01/2022.
//

import SwiftUI
import SwordleModel
import os

@main
struct SwordleApp: App {
    
    let log = Logger()

    let startDate: Date = {
        var components = DateComponents()
        components.day = 19
        components.month = 6
        components.year = 2021
        components.hour = 0
        components.minute = 0
        return Calendar.current.date(from: components)!
    }()

    init() {
        let daysSinceStart = Calendar.current.daysSince(startDate)
        let data = getCSVData().map { $0.fromBase64()! }
        let puzzleNumber = daysSinceStart
        log.debug("Puzzle #\(puzzleNumber): \(data[puzzleNumber])")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func getCSVData() -> Array<String> {
        do {
            guard let path = Bundle.main.path(forResource: "words", ofType: "txt") else { return [] }
            log.debug("Loading words list from: \(path)")
            let content = try String(contentsOfFile: path)
            let parsedCSV: [String] = content.components(separatedBy: "\n")
            return parsedCSV
        } catch {
            log.debug("Failed to load words list")
            print(error)
            return []
        }
    }
}

extension Calendar {
    func daysSince(_ date: Date) -> Int {
        let fromDate = startOfDay(for: date)
        let numberOfDays = dateComponents([.day], from: fromDate, to: .now)
        return numberOfDays.day!
    }
}

extension String {
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }
}
