//
//  SudokuView.swift
//  thiiink
//
//  Created by Manuel Julian Asbeck on 22.07.24.
//

import SwiftUI

struct SudokuView: View {
    
    @EnvironmentObject var dm: SudokuDataModel
    
    var body: some View {
        VStack {
            ForEach(0..<dm.puzzle.count, id: \.self) { row in
                HStack {
                    ForEach(0..<dm.puzzle[row].count, id: \.self) { col in
                        if (dm.puzzle[row][col] == 0) {
                            Text("")
                                .frame(width: 32, height: 32)
                                .border(Color.black)
                        } else {
                            Text("\(dm.puzzle[row][col])")
                                .frame(width: 32, height: 32)
                                .border(Color.black)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    SudokuView()
        .environmentObject(SudokuDataModel())
}
