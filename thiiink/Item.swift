//
//  Item.swift
//  thiiink
//
//  Created by Manuel Julian Asbeck on 21.07.24.
//

import Foundation
import SwiftData

@Model
class Statistic {
    var timestamp: Date
    var score: Int
    var game: String
    var won: Bool
    
    init(score: Int, game: String, won: Bool) {
        self.timestamp = Date.now
        self.score = score
        self.game = game
        self.won = won
    }
}
