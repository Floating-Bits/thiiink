//
//  LetterButton.swift
//  cluu
//
//  Created by Manuel Julian Asbeck on 29.06.24.
//

import SwiftUI

struct LetterButtonView: View {
    
    @EnvironmentObject var dm: WordleDataModel
    var letter: String
    
    var body: some View {
        Button {
            dm.addToCurrentWord(letter)
        } label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(dm.keyColors[letter])
                .foregroundStyle(.primary)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .buttonStyle(.plain)
    }
}

//#Preview {
//    LetterButtonView(letter: "L")
//        .environmentObject(WordleDataModel())
//}
