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
        XCTAssertEqual(game.score(), 40)
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
        
        XCTAssertEqual(game.score(), 25)
    }
    
    func testStrikeGame() {
        //First throws 7
        game.frame(pins: 1)
        game.frame(pins: 6)
        
        //Strike throw 10 + 3 + 2
        game.frame(pins: 10)
        
        //Next throw 5
        game.frame(pins: 3)
        game.frame(pins: 2)
        
        //Rest of the game 42
        gameFrames(pins: 3, frames: 14)
        
        XCTAssertEqual(game.score(), 69)
    }
    
    func testPerfectGame() {
        gameFrames(pins: 10, frames: 12)
        
        XCTAssertEqual(game.score(), 300)
    }
    
    func testNormalGame() {
        game.frame(pins: 1)
        game.frame(pins: 2)
        game.frame(pins: 6)
        game.frame(pins: 3)
        game.frame(pins: 6)
        game.frame(pins: 4)
        game.frame(pins: 5)
        game.frame(pins: 5)
        game.frame(pins: 10)
        game.frame(pins: 0)
        game.frame(pins: 1)
        game.frame(pins: 7)
        game.frame(pins: 5)
        game.frame(pins: 6)
        game.frame(pins: 4)
        game.frame(pins: 10)
        game.frame(pins: 2)
        game.frame(pins: 8)
        game.frame(pins: 6)
        
        XCTAssertEqual(game.score(), 127)
    }
    
    func testAllSpares() {
        gameFrames(pins: 5, frames: 21)
        XCTAssertEqual(game.score(), 150)
    }
    
    private func gameFrames(pins: Int, frames: Int) {
        for _ in 1...frames {
            game.frame(pins: pins)
        }
    }
}
