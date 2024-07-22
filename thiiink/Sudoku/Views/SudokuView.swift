//
//  SudokuView.swift
//  thiiink
//
//  Created by Manuel Julian Asbeck on 22.07.24.
//

import SwiftUI

struct SudokuView: View {
    
    @EnvironmentObject var dm: SudokuDataModel
    
    @State private var selectedX: Int = 0
    @State private var selectedY: Int = 0
    
    private var size: CGFloat = 40
    
    var body: some View {
        VStack (spacing: 0) {
            ForEach(0..<dm.puzzle.count, id: \.self) { row in
                HStack (spacing: 0) {
                    ForEach(0..<dm.puzzle[row].count, id: \.self) { col in
                        if (dm.puzzle[row][col] == 0) {
                            BoxView(" ", row, col)
                        } else {
                            BoxView("\(dm.puzzle[row][col])", row, col)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private func BoxView(_ text: String, _ row: Int, _ col: Int) -> some View {
        Text(text)
            .frame(width: size, height: size)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
            .font(.title)
            .border(Color.black)
            .onTapGesture {
                selectedX = row
                selectedY = col
            }
            .background(selectedX == row && selectedY == col ? Color.yellow.opacity(0.3) : Color(uiColor: .systemBackground))
    }
}

#Preview {
    SudokuView()
        .environmentObject(SudokuDataModel())
}
