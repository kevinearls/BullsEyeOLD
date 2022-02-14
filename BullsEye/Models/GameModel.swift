//
//  GameModel.swift
//  BullsEye
//
//  Created by Kevin Earls on 21/01/2022.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    // 100 point bonus for an exact score, 50 for within 2?
    func points(sliderValue: Int) -> Int {
        let difference = abs(self.target - sliderValue)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    // game.startNewRound(points: data.points)
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
}
