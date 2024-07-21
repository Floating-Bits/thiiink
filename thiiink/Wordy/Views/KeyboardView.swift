//
//  KeyboardView.swift
//  cluu
//
//  Created by Manuel Julian Asbeck on 29.06.24.
//

import SwiftUI

struct KeyboardView: View {
    
    @EnvironmentObject var dm: WordleDataModel
    
    var topRowArray = "QWERTYUIOP".map{ String($0) }
    var middleRowArray = "ASDFGHJKL".map{ String($0) }
    var bottomRowArray = "ZXCVBNM".map{ String($0) }
    
    var body: some View {
        VStack (spacing: 4) {
            HStack (spacing: 2) {
                ForEach(topRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
            }
            HStack (spacing: 2) {
                ForEach(middleRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
            }
            HStack (spacing: 2) {
                Button {
                    dm.enterWord()
                } label: {
                    Text("Enter")
                        .font(.system(size: 20))
                        .frame(width: 60, height: 50)
                        .background(Color.unused)
                        .foregroundStyle(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                .buttonStyle(.plain)
                .disabled(dm.currentWord.count < 5 || !dm.inPlay)
                .opacity(dm.currentWord.count < 5 || !dm.inPlay ? 0.6 : 1)
                ForEach(bottomRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 : 1)
                Button {
                    dm.removeLetterFromCurrentWord()
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 40, height: 50)
                        .background(Color.unused)
                        .foregroundStyle(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                .buttonStyle(.plain)
                .disabled(!dm.inPlay || dm.currentWord.count == 0)
                .opacity(!dm.inPlay || dm.currentWord.count == 0 ? 0.6 : 1)
            }
        }
    }
}

//#Preview {
//    KeyboardView()
//        .environmentObject(WordleDataModel())
//        .scaleEffect(Global.keyboardScale)
//}
