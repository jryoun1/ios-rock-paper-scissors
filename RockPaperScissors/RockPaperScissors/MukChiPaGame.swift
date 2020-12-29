//
//  MukChiPaGame.swift
//  RockPaperScissors
//
//  Created by Yeon on 2020/12/29.
//

import Foundation

final class MukChiPaGame: RockPaperScissorGame {
    override func judgeWinDrawLose(computerHand: Int, _ userHand: Int, turn: String? = nil) -> String {
        var result: String = GameError.canNotJudge.localizedDescription
        guard let winner = turn else {
            return GameError.canNotJudge.localizedDescription
        }
        
        switch computerHand {
        case mukChiPa.muk.rawValue:
            if userHand == mukChiPa.muk.rawValue {
                result = "\(winner)의 승리!"
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
                result = "\(winner)의 승리!"
            }
            else {
                result = Player.computer
            }
        default:
            if userHand == mukChiPa.muk.rawValue {
                result = Player.user
            }
            else if userHand == mukChiPa.chi.rawValue {
                result = Player.computer
            }
            else {
                result = "\(winner)의 승리!"
            }
        }
        return result
    }
    
    override func printGameIntroduction(player: String? = nil) {
        guard let gamePlayer = player else {
            return
        }
        print("[\(gamePlayer) 턴] \(GameIntroduction.mukChiPa)", terminator:"")
    }
    
    func printTurn(by judgement: String) {
        switch judgement {
        case Player.user:
            print("\(judgement)의 턴입니다")
        case Player.computer:
            print("\(judgement)의 턴입니다")
        default:
            return
        }
    }
    
    func printMukChiPaResult(by judgement: String) {
        print(judgement)
    }
}
