//
//  ContentView.swift
//  cluu
//
//  Created by Manuel Julian Asbeck on 28.06.24.
//

import SwiftUI
import SwiftData

struct WordyView: View {
    
    @EnvironmentObject var dm: WordleDataModel

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack (spacing: 5) {
                    ForEach(0...5, id: \.self) { index in
                        GuessView(guess: $dm.guesses[index])
                            .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index])))
                    }
                }
                .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                Spacer()
                KeyboardView()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
                Spacer()
            }
            .overlay (alignment: .top) {
                if let toastText = dm.toastText {
                    ToastView(toastText: toastText)
//                        .offset(y: 20)
                }
            }
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    HStack {
                        if !dm.inPlay {
                            Button {
                                dm.newGame()
                            } label: {
                                Text("New Game")
                                    .foregroundStyle(.primary)
                            }
                        }
                    }
                }
            }
            .onAppear {
                dm.newGame()
            }
        }
    }
}

#Preview {
    WordyView()
        .environmentObject(WordleDataModel())
}
