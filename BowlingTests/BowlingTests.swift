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
        for _ in 1...20 {
            game.frame(pins: 0)
        }
        
        XCTAssertTrue(game.score == 0, "Worst game ever")
    }

     func testNoSparesNoStrikesGame() {
           for _ in 1...20 {
               game.frame(pins: 2)
           }
           
           XCTAssertTrue(game.score == 40, "Learning how to play")
       }

}
