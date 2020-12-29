//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum RockPaperScissors : Int {
    case Scissors = 1
    case Rock = 2
}

enum mukChiPa : Int {
    case Muk = 1
    case Chi = 2
}

func printRockPaperScissors() {
    print("가위(1).바위(2).보(3)! <종료 : 0> : ", terminator:"")
}

func judgmentWinDrawLose(computerHand : Int, userHand : Int) -> String {
    var result : String = "승패를 판단하지 못했습니다. 오류입니다."
    let Scissors = RockPaperScissors.Scissors.rawValue
    let Rock = RockPaperScissors.Rock.rawValue
    switch computerHand {
    case Scissors :
        if userHand == Scissors { print("비겼습니다!"); result = "비겼습니다!" }
        else if userHand == Rock { print("이겼습니다!"); result = "이겼습니다!" }
        else { print("졌습니다!"); result = "졌습니다!" }
    case Rock :
        if userHand == Scissors { print("졌습니다!"); result = "졌습니다!" }
        else if userHand == Rock { print("비겼습니다!"); result = "비겼습니다!" }
        else { print("이겼습니다!"); result = "이겼습니다!" }
    default :
        if userHand == Scissors { print("이겼습니다!"); result = "이겼습니다!" }
        else if userHand == Rock { print("졌습니다!"); result = "졌습니다!" }
        else { print("비겼습니다!"); result = "비겼습니다!" }
    }
    return result
}

func createComputerRockPaperScissors() -> Int {
    let computerNumber = Int.random(in : 1...3)
    return computerNumber
}

func inputRockPaperScissors() -> String {
    guard let input = readLine() else { print("입력하지 않아서 종료합니다."); return "0" }
    return input
}

func verifyInput(userInput : String) -> Int {
    var userNumber = Int(userInput) ?? -1
    if userNumber > 3 || userNumber < 0 {
        userNumber = -1
    }
    return userNumber
}

func startRockPaperScissors() {
    printRockPaperScissors()
    var number : Int?
    number = verifyInput(userInput : inputRockPaperScissors())
    guard let userNumber = number else { print("검증하지 못한 입력 값 이라서 종료됩니다."); return }
    switch userNumber {
    case -1 :
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return startRockPaperScissors()
    case 0 :
        return print("게임 종료")
    default :
        var result : String = "가위 바위 보 승패를 판단하지 못했습니다. 오류입니다."
        result = judgmentWinDrawLose(computerHand : createComputerRockPaperScissors(), userHand : userNumber)
        if result == "비겼습니다!" {
            return startRockPaperScissors()
        } else if result == "이겼습니다!" {
            startMukChiPa(rockPaperScissorsWinner : "사용자")
        } else {
            startMukChiPa(rockPaperScissorsWinner : "컴퓨터")
        }
    }
}

func printMukChiPa(whoseTurn : String) {
    print("[\(whoseTurn) 턴] 묵(1). 찌(2). 빠(3)! <종료 : 0> : ", terminator:"")
}

func printMukChiPaResult(by judgement : String) {
    print(judgement)
}

func printTurn(by judgement : String) {
    switch judgement {
    case "사용자" :
        print("\(judgement)의 턴입니다")
    default :
        print("\(judgement)의 턴입니다")
    }
}

func judgementMukChiPaWinLose(computerHand : Int, userHand : Int, turn : String) -> String {
    var result : String = "승패를 구별하지 못했습니다. 오류입니다."
    let Muk = mukChiPa.Muk.rawValue
    let Chi = mukChiPa.Chi.rawValue
        switch computerHand {
        case Muk :
            if userHand == Muk { result = "\(turn)의 승리!" }
            else if userHand == Chi { result = "컴퓨터" }
            else { result = "사용자" }
        case Chi :
            if userHand == Muk { result = "사용자" }
            else if userHand == Chi { result = "\(turn)의 승리!" }
            else { result = "컴퓨터" }
        default :
            if userHand == Muk { result = "사용자" }
            else if userHand == Chi { result = "컴퓨터" }
            else { result = "\(turn)의 승리!" }
        }
    return result
}

func startMukChiPa(rockPaperScissorsWinner : String) {
    printMukChiPa(whoseTurn : rockPaperScissorsWinner)
    var number : Int?
    number = verifyInput(userInput : inputRockPaperScissors())
    guard let userVerifiedInputNumber = number else { print("검증하지 못한 입력 값 이라서 종료됩니다."); return }
    switch userVerifiedInputNumber {
    case -1 :
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startMukChiPa(rockPaperScissorsWinner : "컴퓨터")
    case 0 :
        return print("게임 종료")
    default :
        var judgment : String = "묵찌빠 승패를 판단하지 못했습니다. 오류입니다."
        judgment = judgementMukChiPaWinLose(computerHand : createComputerRockPaperScissors(), userHand : userVerifiedInputNumber, turn : rockPaperScissorsWinner)
        if judgment == "사용자" {
            printTurn(by : judgment)
            startMukChiPa(rockPaperScissorsWinner : judgment)
        } else if judgment == "컴퓨터" {
            printTurn(by : judgment)
            startMukChiPa(rockPaperScissorsWinner : judgment)
        } else {
            printMukChiPaResult(by : judgment)
        }
    }
}

startRockPaperScissors()
