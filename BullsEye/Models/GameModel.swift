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
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(self.target - sliderValue)
        return 100 - difference
    }
    
    // game.startNewRound(points: data.points)
    func startNewRound(points: Int) {
        print("NYI...")
        //target = Int.random(in: 1...100)
    }
}
