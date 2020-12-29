//
//  GameStringCollection.swift
//  RockPaperScissors
//
//  Created by Yeon on 2020/12/29.
//

import Foundation

enum GameIntroduction {
    static let rockPaperScissor = "가위(1).바위(2).보(3)! <종료 : 0> : "
    static let mukChiPa = "묵(1). 찌(2). 빠(3)! <종료 : 0> : "
    static let wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    static let gameTermination = "게임이 종료됩니다."
}

enum GameResult {
    static let win = "이겼습니다!"
    static let draw = "비겼습니다!"
    static let lose = "졌습니다!"
}

enum Player {
    static let user = "사용자"
    static let computer = "컴퓨터"
}

enum RockPaperScissor: Int {
    case scissor = 1
    case rock = 2
    case paper = 3
}

enum mukChiPa: Int {
    case muk = 1
    case chi = 2
    case pa = 3
}
