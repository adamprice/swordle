//
//  SwordleTests.swift
//  SwordleTests
//
//  Created by Adam Price on 22/01/2022.
//

import XCTest
import Nimble
@testable import SwordleModel

class GameStateTests: XCTestCase {
    
    func testDecode() throws {
        
        let json =
        """
        {
            "boardState": [
                "aahed",
                "smack",
                "puppy",
                "upset",
                "",
                ""
            ],
            "evaluations": [
                [
                    "absent",
                    "absent",
                    "absent",
                    "absent",
                    "absent"
                ],
                [
                    "absent",
                    "absent",
                    "absent",
                    "correct",
                    "correct"
                ],
                [
                    "correct",
                    "absent",
                    "absent",
                    "absent",
                    "absent"
                ],
                [
                    "absent",
                    "present",
                    "absent",
                    "absent",
                    "absent"
                ],
                null,
                null
            ],
            "rowIndex": 4,
            "solution": "prick",
            "gameStatus": "IN_PROGRESS",
            "lastPlayedTs": 1642785871953,
            "lastCompletedTs": null,
            "restoringFromLocalStorage": null,
            "hardMode": false
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let state = try decoder.decode(GameState.self, from: json)
    }
    
    func testEncode() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.withoutEscapingSlashes, .prettyPrinted, .sortedKeys]
        
        let gameState = GameState(boardState: [],
                                  evaluations: [],
                                  rowIndex: 0,
                                  solution: "sandy",
                                  gameStatus: .inProgress,
                                  lastPlayed: .now,
                                  lastCompleted: .now,
                                  restoringFromUserDefaults: false,
                                  hardMode: false)
        
        let encoded = try encoder.encode(gameState)
        
        let jsonOutputString = String(data: encoded, encoding: .utf8)!
        
        expect(jsonOutputString).to(equal(
        """
        {
          "boardState" : [

          ],
          "evaluations" : [

          ],
          "gameStatus" : {
            "inProgress" : {

            }
          },
          "hardMode" : false,
          "lastCompleted" : 664649404.51770103,
          "lastPlayed" : 664649404.51770103,
          "restoringFromUserDefaults" : false,
          "rowIndex" : 0,
          "solution" : "sandy"
        }
        """
        ))
    }
}
