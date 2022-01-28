import Foundation

public enum GameStatus: Codable {
    case win
    case inProgress
    case fail
}

public enum Evaluation: Codable {
    case correct
    case present
    case absent
}

public class GameState: Codable, ObservableObject {
    
    enum CodingKeys: String, CodingKey {
        case boardState
        case evaluations
        case rowIndex
        case solution
        case gameStatus
        case lastPlayed
        case lastCompleted
        case restoringFromUserDefaults
        case hardMode
    }
    
    @Published public var boardState: [String]
    @Published public var evaluations: [[Evaluation]] // correct, present, absent
    @Published public var rowIndex: Int
    @Published public var solution: String
    @Published public var gameStatus: GameStatus
    @Published public var lastPlayed: Date
    @Published public var lastCompleted: Date
    @Published public var restoringFromUserDefaults: Bool
    @Published public var hardMode: Bool
    
    public init(boardState: [String],
                evaluations: [[Evaluation]],
                rowIndex: Int,
                solution: String,
                gameStatus: GameStatus,
                lastPlayed: Date,
                lastCompleted: Date,
                restoringFromUserDefaults: Bool,
                hardMode: Bool) {
        self.boardState = boardState
        self.evaluations = evaluations
        self.rowIndex = rowIndex
        self.solution = solution
        self.gameStatus = gameStatus
        self.lastPlayed = lastPlayed
        self.lastCompleted = lastCompleted
        self.restoringFromUserDefaults = restoringFromUserDefaults
        self.hardMode = hardMode
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        boardState = try container.decode([String].self, forKey: .boardState)
        evaluations = try container.decode([[Evaluation]].self, forKey: .evaluations)
        rowIndex = try container.decode(Int.self, forKey: .rowIndex)
        solution = try container.decode(String.self, forKey: .solution)
        gameStatus = try container.decode(GameStatus.self, forKey: .gameStatus)
        lastPlayed = try container.decode(Date.self, forKey: .lastPlayed)
        lastCompleted = try container.decode(Date.self, forKey: .lastCompleted)
        restoringFromUserDefaults = try container.decode(Bool.self, forKey: .restoringFromUserDefaults)
        hardMode = try container.decode(Bool.self, forKey: .hardMode)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(boardState, forKey: .boardState)
        try container.encode(evaluations, forKey: .evaluations)
        try container.encode(rowIndex, forKey: .rowIndex)
        try container.encode(solution, forKey: .solution)
        try container.encode(gameStatus, forKey: .gameStatus)
        try container.encode(lastPlayed, forKey: .lastPlayed)
        try container.encode(lastCompleted, forKey: .lastCompleted)
        try container.encode(restoringFromUserDefaults, forKey: .restoringFromUserDefaults)
        try container.encode(hardMode, forKey: .hardMode)
    }
}
