//
//  GameStore.swift
//  UsedGames
//
//  Created by Buket Bayhan on 20.01.2025.
//

import Foundation


class GameStore{
    
    var games: [Game] = []
    
    init() {
        for _ in 0..<5 {
            createGame()
        }
    }
    
  @discardableResult func createGame() -> Game{
        
        let game = Game(random: true)
        games.append(game)
        return game
    }
}
