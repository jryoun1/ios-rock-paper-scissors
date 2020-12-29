//
//  RockPaperScissorGame.swift
//  RockPaperScissor
//
//  Created by Yeon on 2020/12/29.
//

import Foundation

class RockPaperScissorGame {
    func generateComputerRockPaperScissor() -> Int {
        let computerNumber = Int.random(in: 1...3)
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
    
    func judgeWinDrawLose(computerHand: Int,_ userHand: Int, turn: String? = nil) -> String {
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
    
    func printGameIntroduction(player: String? = nil) {
        print("\(GameIntroduction.rockPaperScissor)", terminator: "")
    }
}
