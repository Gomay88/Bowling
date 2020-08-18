//
//  BowlingTests.swift
//  BowlingTests
//
//  Created by Víctor Jiménez on 18/08/2020.
//  Copyright © 2020 Víctor Jiménez. All rights reserved.
//

import XCTest
@testable import Bowling

class BowlingTests: XCTestCase {
    
    let game = GamePresenter()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyGame() {
        gameFrames(pins: 0, frames: 20)
        XCTAssertTrue(game.score() == 0, "Worst game ever")
    }

    func testNoSparesNoStrikesGame() {
        gameFrames(pins: 2, frames: 20)
        XCTAssertTrue(game.score() == 40, "Learning how to play")
    }
    
    func testSpareGame() {
        //First throws 7
        game.frame(pins: 1)
        game.frame(pins: 6)
        
        //Spare throw 10 + 3
        game.frame(pins: 6)
        game.frame(pins: 4)
        
        //Next throw 5
        game.frame(pins: 3)
        game.frame(pins: 2)
        
        //Rest of the game 42
        gameFrames(pins: 3, frames: 14)
        
        XCTAssertEqual(game.score(), 67)
    }
    
    private func gameFrames(pins: Int, frames: Int) {
        for _ in 1...frames {
            game.frame(pins: pins)
        }
    }
}
