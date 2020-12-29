//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func printRockPaperScissorGameIntroduction() {
    print("\(GameIntroduction.rockPaperScissor)", terminator: "")
}

func printMukChiPaIntroduction(player: String) {
    print("[\(player) 턴] \(GameIntroduction.mukChiPa)", terminator:"")
}

func generateComputerRockPaperScissor() -> Int {
    let computerNumber = Int.random(in : 1...3)
    return computerNumber
}

func inputFromUser() -> String {
    guard let input = readLine() else {
        return GameError.noInputFromUser.localizedDescription
    }
    return input
}

func verifyInput(input: String) -> String {
    guard let userInput = Int(input), userInput < 4 && userInput > -1 else {
        return GameIntroduction.wrongInput
    }
    return String(userInput)
}

func judgmentWinDrawLose(computerHand : Int,_ userHand : Int) -> String {
    var result: String = GameError.canNotJudge.localizedDescription
    
    switch computerHand {
    case RockPaperScissor.scissor.rawValue:
        if userHand == RockPaperScissor.scissor.rawValue {
            result = GameResult.draw
        }
        else if userHand == RockPaperScissor.rock.rawValue {
            result = GameResult.win
        }
        else {
            result = GameResult.lose
        }
    case RockPaperScissor.rock.rawValue:
        if userHand == RockPaperScissor.scissor.rawValue {
            result = GameResult.lose
        }
        else if userHand == RockPaperScissor.rock.rawValue {
            result = GameResult.draw
        }
        else {
            result = GameResult.win
        }
    default:
        if userHand == RockPaperScissor.scissor.rawValue {
            result = GameResult.win
        }
        else if userHand == RockPaperScissor.rock.rawValue {
            result = GameResult.lose
        }
        else {
            result = GameResult.draw
        }
    }
    
    print(result)
    return result
}

func startGame() {
    printRockPaperScissorGameIntroduction()
    let userInput: String = verifyInput(input: inputFromUser())
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
        result = judgmentWinDrawLose(computerHand: generateComputerRockPaperScissor(), userHand)
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

func printMukChiPaResult(by judgement : String) {
    print(judgement)
}

func printTurn(by judgement : String) {
    switch judgement {
    case Player.user:
        print("\(judgement)의 턴입니다")
    case Player.computer:
        print("\(judgement)의 턴입니다")
    default:
        return
    }
}

func judgementMukChiPaWinLose(computerHand : Int,_ userHand : Int, turn : String) -> String {
    var result : String = GameError.canNotJudge.localizedDescription
    
    switch computerHand {
    case mukChiPa.muk.rawValue:
        if userHand == mukChiPa.muk.rawValue {
            result = "\(turn)의 승리!"
        }
        else if userHand == mukChiPa.chi.rawValue {
            result = Player.computer
        }
        else {
            result = Player.user
        }
    case mukChiPa.chi.rawValue:
        if userHand == mukChiPa.muk.rawValue {
            result = Player.user
        }
        else if userHand == mukChiPa.chi.rawValue {
            result = "\(turn)의 승리!"
        }
        else {
            result = Player.computer
        }
    default :
        if userHand == mukChiPa.muk.rawValue {
            result = Player.user
        }
        else if userHand == mukChiPa.chi.rawValue {
            result = Player.computer
        }
        else {
            result = "\(turn)의 승리!"
        }
    }
    return result
}

func startMukChiPa(rockPaperScissorWinner: String) {
    printMukChiPaIntroduction(player: rockPaperScissorWinner)
    let userInput: String = verifyInput(input: inputFromUser())
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
        
        judgment = judgementMukChiPaWinLose(computerHand : generateComputerRockPaperScissor(),userHand, turn : rockPaperScissorWinner)
        if judgment == Player.user {
            printTurn(by : judgment)
            startMukChiPa(rockPaperScissorWinner: judgment)
        } else if judgment == Player.computer {
            printTurn(by : judgment)
            startMukChiPa(rockPaperScissorWinner: judgment)
        } else {
            printMukChiPaResult(by : judgment)
        }
    }
}

startGame()
