//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Kevin Earls on 26/01/2022.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    var game: Game!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)  // 100 - diff
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)  // 100 - diff
    }
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testScoreExact() {
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose() {
        let guess: Int
        
        if game.target < 98 {
            guess = game.target + 2
        } else {
            guess = game.target - 2
        }
        
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    
    func testRestart() {
        // I don't know why we're doing the first part
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
        
    }
}
