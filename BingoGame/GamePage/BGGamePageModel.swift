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
}
