//
//  GameError.swift
//  RockPaperScissors
//
//  Created by Yeon on 2020/12/29.
//

import Foundation

enum GameError: Error {
    case noInputFromUser
    case canNotJudge
    case unknown
}

extension GameError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInputFromUser:
            return "사용자로 부터 입력이 없어서 종료됩니다."
        case .canNotJudge:
            return "결과를 비교할 수 없습니다."
        case .unknown:
            return "알 수 없는 에러로 인해서 종료됩니다."
        }
    }
}
