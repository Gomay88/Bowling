//
//  GamePresenter.swift
//  Bowling
//
//  Created by Víctor Jiménez on 18/08/2020.
//  Copyright © 2020 Víctor Jiménez. All rights reserved.
//

import Foundation

class GamePresenter {
    
    private var gameThrows = [Int]()
    private var gameScore = 0
    
    func frame(pins: Int) {
        gameThrows.append(pins)
    }
    
    func score() -> Int {
        var spareExtraScore = 0
        
        for (key, value) in gameThrows.enumerated() {
            if key <= gameThrows.count - 2 {
                if spare(pin1: gameThrows[key], pin2: gameThrows[key+1]) {
                    spareExtraScore = gameThrows[key+2]
                }
            }
            
            gameScore += value
        }
        
        return gameScore + spareExtraScore
    }
    
    private func spare(pin1: Int, pin2: Int) -> Bool {
        return pin1 + pin2 == 10 ? true : false
    }
}
