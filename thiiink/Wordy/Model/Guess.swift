//
//  Guess.swift
//  cluu
//
//  Created by Manuel Julian Asbeck on 29.06.24.
//

import Foundation
import SwiftUI

struct Guess {
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .wrong, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map { String($0) }
    }
}
