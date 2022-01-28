import Foundation

public struct Statistics: Codable {
    let currentStreak: Int
    let maxStreak: Int
    let guesses: [String: Int]
    let winPercentage: Int
    let gamesPlayed: Int
    let gamesWon: Int
    let averageGuesses: Double
}
