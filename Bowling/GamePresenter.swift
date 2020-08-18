//
//  GamePresenter.swift
//  Bowling
//
//  Created by Víctor Jiménez on 18/08/2020.
//  Copyright © 2020 Víctor Jiménez. All rights reserved.
//

import Foundation

class GamePresenter {
    
    var score = 0
    
    func frame(pins: Int) {
        score += pins
    }
}
