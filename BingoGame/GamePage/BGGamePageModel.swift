//
//  BGGamePageModel.swift
//  BingoGame
//
//  Created by Patato on 2018/12/9.
//  Copyright © 2018 Patato. All rights reserved.
//

import Foundation

class GamePageModel {
    
    var m_aryRandom = [Int]()
    var m_aryBoard = [Bool]()
    
    
    func randomBoard(_ size: Int, min: Int, max: Int) {
        m_aryRandom = [Int].init(repeating: -1, count: size)
        var bValidNum = true
        for i in 0..<size {
            bValidNum = true
            repeat{
                m_aryRandom[i] = Int.random(in: min...max)
                bValidNum = true
                for j in 0..<i {
                    if m_aryRandom[i] == m_aryRandom[j]{
                        bValidNum = false
                    }
                }
            }while bValidNum == false
        }
    }
    
    func checkBingo(size: Int) -> Int {
        var iLine: Int = 0
        //check raw
        for i in stride(from: 0, to: m_aryBoard.count, by: size) {
            var goalNum = 0
            for j in 0..<size {
                if m_aryBoard[i + j] == true {
                    goalNum = goalNum + 1
                }else {
                    break
                }
            }
            if goalNum == size {
                iLine = iLine + 1
            }
        }
        
        //check column
        for i in 0..<size {
            var goalNum = 0
            for j in stride(from: 0, to: m_aryBoard.count, by: size){
                if m_aryBoard[i + j] == true {
                    goalNum = goalNum + 1
                }else {
                    break
                }
            }
            if goalNum == size {
                iLine = iLine + 1
            }
        }
        
        //check diagonal
        var iGoalNum: Int = 0
        for i in stride(from: 0, to: m_aryBoard.count, by: size + 1){
            if m_aryBoard[i] == true {
                iGoalNum = iGoalNum + 1
            }else {
                break
            }
        }
        if iGoalNum == size {
            iLine = iLine + 1
        }
        
        //check another diagonal
        iGoalNum = 0
        for i in stride(from: size - 1, to: m_aryBoard.count - size + 1, by: size - 1){
            if m_aryBoard[i] == true{
                iGoalNum = iGoalNum + 1
            }else {
                break
            }
        }
        if iGoalNum == size {
            iLine = iLine + 1
        }
        
        return iLine
    
    }
}
