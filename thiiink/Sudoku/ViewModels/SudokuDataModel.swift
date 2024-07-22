//
//  SudokuDataModel.swift
//  thiiink
//
//  Created by Manuel Julian Asbeck on 22.07.24.
//

import Foundation
import Combine

class SudokuDataModel: ObservableObject {
    @Published var puzzle: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @Published var solution: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    
    enum Difficulty {
        case easy, medium, hard, extreme
    }
    
    init() {
        generateSudoku(difficulty: .extreme)
    }
    
    func generateSudoku(difficulty: Difficulty) {
        puzzle = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        solution = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        
        // Generate a complete puzzle
        fillGrid(&puzzle)
        
        // Make a copy for the solution
        solution = puzzle
        
        // Remove numbers to create a puzzle
        removeNumbers(&puzzle, difficulty: difficulty)
    }
    
    func fillGrid(_ grid: inout [[Int]]) -> Bool {
        for row in 0..<9 {
            for col in 0..<9 {
                if grid[row][col] == 0 {
                    for num in 1...9 {
                        if isValid(grid, row, col, num) {
                            grid[row][col] = num
                            if fillGrid(&grid) {
                                return true
                            }
                            grid[row][col] = 0
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    func isValid(_ grid: [[Int]], _ row: Int, _ col: Int, _ num: Int) -> Bool {
        for i in 0..<9 {
            if grid[row][i] == num || grid[i][col] == num || grid[row - row % 3 + i / 3][col - col % 3 + i % 3] == num {
                return false
            }
        }
        return true
    }
    
    func removeNumbers(_ grid: inout [[Int]], difficulty: Difficulty) {
        var attempts = difficulty == .easy ? 5 : difficulty == .medium ? 10 : difficulty == .hard ? 20 : 30
        while attempts > 0 {
            let row = Int.random(in: 0..<9)
            let col = Int.random(in: 0..<9)
            if grid[row][col] != 0 {
                let backup = grid[row][col]
                grid[row][col] = 0
                let copy = grid
                if !canBeSolved(copy) {
                    grid[row][col] = backup
                }
                attempts -= 1
            }
        }
    }
    
    func canBeSolved(_ grid: [[Int]]) -> Bool {
        var copy = grid
        return solve(&copy)
    }
    
    func solve(_ grid: inout [[Int]]) -> Bool {
        for row in 0..<9 {
            for col in 0..<9 {
                if grid[row][col] == 0 {
                    for num in 1...9 {
                        if isValid(grid, row, col, num) {
                            grid[row][col] = num
                            if solve(&grid) {
                                return true
                            }
                            grid[row][col] = 0
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
}
