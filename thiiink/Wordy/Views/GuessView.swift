//
//  GuessView.swift
//  cluu
//
//  Created by Manuel Julian Asbeck on 29.06.24.
//

import SwiftUI

struct GuessView: View {
    
    @Binding var guess: Guess
    
    var body: some View {
        HStack (spacing: 5) {
            ForEach(0...4, id: \.self) { index in
                FlipView(isFlipped: $guess.cardFlipped[index]) {
                    Text(guess.guessLetters[index])
                        .fontDesign(.rounded)
                        .foregroundStyle(.primary)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .background(Color(uiColor: .systemBackground))
                        .font(.system(size: 35, weight: .heavy))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundStyle(.secondary))
//                        .border(Color.secondary)
                } back: {
                    Text(guess.guessLetters[index])
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .background(guess.bgColors[index])
                        .font(.system(size: 35, weight: .heavy))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundStyle(.secondary))
//                        .border(Color.secondary)
                }

            }
        }
    }
}

#Preview {
    GuessView(guess: .constant(Guess(index: 0)))
}
