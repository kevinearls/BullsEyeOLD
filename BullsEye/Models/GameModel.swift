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
    struct LeaderboardEntry {
        let points: Int
        let date: Date
    }
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboard.append(LeaderboardEntry(points: 100, date: Date()))
            leaderboard.append(LeaderboardEntry(points: 80, date: Date()))
            leaderboard.append(LeaderboardEntry(points: 200, date: Date()))
            leaderboard.append(LeaderboardEntry(points: 50, date: Date()))
            leaderboard.append(LeaderboardEntry(points: 20, date: Date()))
            
            leaderboard.sort { $0.points > $1.points }

        }
    }

    var leaderboard: [LeaderboardEntry] = []
    
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
    
    mutating func addToLeaderboard(points: Int) {
        leaderboard.append(LeaderboardEntry(points: points, date: Date()))
        leaderboard.sort { $0.points > $1.points }
    }
    
    
    mutating func startNewRound(points: Int) {
        addToLeaderboard(points: points)
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
