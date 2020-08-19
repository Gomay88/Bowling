//
//  GamePresenter.swift
//  Bowling
//
//  Created by Víctor Jiménez on 18/08/2020.
//  Copyright © 2020 Víctor Jiménez. All rights reserved.
//

import Foundation

class GamePresenter {
    
    private var frames = [Int]()
    private var gameScore: Int = 0
    
    func frame(pins: Int) {
        if frames.count < 21 {
            frames.append(pins)
        }
    }
    
    func score() -> Int {
        while frames.count < 21 {
            frames.append(0)
        }
        
        var extraScore = 0
        var gameThrow = 0
        
        for _ in 1...9 {
            if strike(pin1: frames[gameThrow]) {
                extraScore += frames[gameThrow+1] + frames[gameThrow+2]
                gameThrow += 1
            } else if spare(pin1: frames[gameThrow], pin2: frames[gameThrow+1]) {
                extraScore += frames[gameThrow+2]
                gameThrow += 2
            } else {
                gameThrow += 2
            }
        }
        
        return frames.reduce(0, +) + extraScore
    }
    
    private func spare(pin1: Int, pin2: Int) -> Bool {
        return pin1 + pin2 == 10 ? true : false
    }
    
    private func strike(pin1: Int) -> Bool {
        return pin1 == 10 ? true : false
    }
}
