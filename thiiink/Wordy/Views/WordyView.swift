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
    
    @State private var bounceToggle: Bool = false
    
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
        .sheet(isPresented: Binding(
            get: { !dm.inPlay },
            set: { dm.inPlay = !$0 }
        )) {
            VStack {
                if (dm.tryIndex <= 5) {
                    Text("\(dm.toastWords[dm.tryIndex])!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                        .fontDesign(.rounded)
                } else {
                    Text("Game Over!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                        .fontDesign(.rounded)
                }
                Spacer()
                if (dm.tryIndex <= 5) {
                    Image(systemName: "fireworks")
                        .symbolEffect(.bounce, value: bounceToggle)
                        .fontWeight(.semibold)
                        .font(.system(size: 80))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow, .orange)
                        .onAppear {
                            bounceToggle.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                bounceToggle.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline:.now() +  1.0) {
                                bounceToggle.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                bounceToggle.toggle()
                            }
                        }
                } else {
                    Text("❌")
                        .fontWeight(.semibold)
                        .font(.system(size: 80))
                }
                Spacer()
                Button {
                    dm.newGame()
                } label: {
                    HStack {
                        Spacer()
                        Text("New Game")
                            .foregroundStyle(Color(uiColor: .systemBackground))
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                        Spacer()
                    }
                }
                .padding()
                .background(Color.primary)
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.bottom)
            }
            .presentationDetents([.fraction(0.45)])
            .interactiveDismissDisabled()
            .presentationCornerRadius(30)
            .presentationBackground(Material.thick)
        }
    }
}

#Preview {
    WordyView()
        .environmentObject(WordleDataModel())
}
