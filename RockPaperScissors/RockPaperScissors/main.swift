//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

private let rockPaperScissorGame = RockPaperScissorGame()
private let mukChiPaGame = MukChiPaGame()

private func startGame() {
    rockPaperScissorGame.printGameIntroduction()
    let userInput: String = rockPaperScissorGame.verifyInput(input: rockPaperScissorGame.inputFromUser())
    var result: String?
    
    switch userInput {
    case GameIntroduction.wrongInput:
        print(GameIntroduction.wrongInput)
        startGame()
    case "0":
        print(GameIntroduction.gameTermination)
        return
    default:
        guard let userHand = Int(userInput) else {
            print(GameError.unknown.localizedDescription)
            return
        }
        result = rockPaperScissorGame.judgeWinDrawLose(computerHand: rockPaperScissorGame.generateComputerRockPaperScissor(), userHand)
    }
    
    switch result {
    case GameResult.win:
        startMukChiPa(rockPaperScissorWinner: Player.user)
    case GameResult.lose:
        startMukChiPa(rockPaperScissorWinner: Player.computer)
    default:
        startGame()
    }
}

private func startMukChiPa(rockPaperScissorWinner: String) {
    mukChiPaGame.printGameIntroduction(player: rockPaperScissorWinner)
    let userInput: String = mukChiPaGame.verifyInput(input: mukChiPaGame.inputFromUser())
    var judgment: String
    
    switch userInput {
    case GameIntroduction.wrongInput:
        print(GameIntroduction.wrongInput)
        startMukChiPa(rockPaperScissorWinner: Player.computer)
    case "0":
        print(GameIntroduction.gameTermination)
        return
    default :
        guard let userHand = Int(userInput) else {
            print(GameError.unknown.localizedDescription)
            return
        }
        judgment = mukChiPaGame.judgeWinDrawLose(computerHand: mukChiPaGame.generateComputerRockPaperScissor(),
                                                 userHand,
                                                 turn: rockPaperScissorWinner)
        
        switch judgment {
        case Player.user:
            mukChiPaGame.printTurn(by: judgment)
            startMukChiPa(rockPaperScissorWinner: judgment)
        case Player.computer:
            mukChiPaGame.printTurn(by: judgment)
            startMukChiPa(rockPaperScissorWinner: judgment)
        default:
            mukChiPaGame.printMukChiPaResult(by: judgment)
        }
    }
}

startGame()
