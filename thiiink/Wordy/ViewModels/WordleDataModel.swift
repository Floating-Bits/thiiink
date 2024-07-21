//
//  WordleDataModel.swift
//  cluu
//
//  Created by Manuel Julian Asbeck on 29.06.24.
//

import Foundation
import SwiftUI
import SwiftData

class WordleDataModel: ObservableObject {
    
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    @Published var toastText: String?
    
    private var vocab: [String]
    
    var keyColors = [String: Color]()
    var matchedLetters = [String]()
    var misplacedLetters = [String]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    var gameOver = false
    var toastWords = ["Genius", "Maginificent", "Impressive", "Splendid", "Great", "Phew"]
    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disabledKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    // MARK: SETUP
    
    init() {
        self.vocab = []
        newGame()
    }
    
    init(vocab: [String]) {
        self.vocab = vocab
        newGame()
    }
    
    init(guesses: [Guess]) {
        self.vocab = []
        self.guesses = guesses
    }
    
    func newGame() {
        populateDefaults()
        self.selectedWord = try! vocab.filter(#Predicate<String> { $0.count == 5 }).randomElement()?.uppercased() ?? "NODES"
        print("\(selectedWord)")
        self.currentWord = ""
        self.inPlay = true
        self.tryIndex = 0
        self.gameOver = false
    }
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters {
            keyColors[String(char)] = Color.unused
        }
        matchedLetters = []
        misplacedLetters = []
    }
    
    // MARK: Game Play
    func addToCurrentWord(_ letter: String) {
        self.currentWord += letter
        updateRow()
    }
    
    func enterWord() {
        if currentWord == selectedWord {
            gameOver = true
            print("You Win")
            setCurrentGuessColors()
            showToast(with: toastWords[tryIndex] + "!")
            inPlay = false
        } else {
            if verifyWord() {
                print("Valid word")
                setCurrentGuessColors()
                tryIndex += 1
                currentWord = ""
                if tryIndex == 6 {
                    gameOver = true
                    inPlay = false
                    print("You lose")
                }
            } else {
                withAnimation {
                    self.incorrectAttempts[tryIndex] += 1
                }
                showToast(with: "Not in word list.")
                incorrectAttempts[tryIndex] = 0
            }
        }
    }
    
    func removeLetterFromCurrentWord() {
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
    
    func setCurrentGuessColors() {
        let correctLetters = selectedWord.map{ String($0) }
        var frequency = [String: Int]()
        for letter in correctLetters {
            frequency[letter, default: 0] += 1
        }
        
        for index in 0...4 {
            let correctLetter = correctLetters[index]
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if guessLetter == correctLetter {
                guesses[tryIndex].bgColors[index] = .correct
                if !matchedLetters.contains(guessLetter) {
                    matchedLetters.append(guessLetter)
                    keyColors[guessLetter] = .correct
                }
                if misplacedLetters.contains(guessLetter) {
                    if let index = misplacedLetters.firstIndex(where: {$0 == guessLetter}) {
                        misplacedLetters.remove(at: index)
                    }
                }
                frequency[guessLetter]! -= 1
            }
        }
        
        for index in 0...4 {
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if correctLetters.contains(guessLetter)
                && guesses[tryIndex].bgColors[index] != .correct
                && frequency[guessLetter]! > 0 {
                guesses[tryIndex].bgColors[index] = .misplaced
                if !misplacedLetters.contains(guessLetter) && !matchedLetters.contains(guessLetter) {
                    misplacedLetters.append(guessLetter)
                    keyColors[guessLetter] = .misplaced
                }
                frequency[guessLetter]! -= 1
            }
        }
        
        for index in 0...4 {
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if keyColors[guessLetter] != .correct
                && keyColors[guessLetter] != .misplaced {
                keyColors[guessLetter] = .wrong
            }
        }
        
        flipCards(for: tryIndex)
    }
    
    func flipCards(for row: Int) {
        for col in 0...4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(col) * 0.2) {
                self.guesses[row].cardFlipped[col].toggle()
            }
        }
    }
    
    func showToast(with text: String?) {
        withAnimation {
            toastText = text
        }
        withAnimation(.linear(duration: 0.2).delay(3)) {
            toastText = nil
        }
    }
}
