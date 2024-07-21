//
//  GameView.swift
//  cluu
//
//  Created by Manuel Julian Asbeck on 30.06.24.
//

import SwiftUI

struct GameView: View {
    
    var title: String
    var image: String
    var description: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color(uiColor: .systemBackground))
                Image(colorScheme == .dark ? "\(image)dark" : "\(image)light")
                    .resizable()
                    .scaledToFit()
                //                .frame(height: 150)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(uiColor: .systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            HStack {
                VStack (alignment: .leading) {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                    Text(description)
                        .font(.footnote)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
//            .background(Material.ultraThin)
        }
//        .padding(.horizontal, 10)
        .background(Material.ultraThin)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(style: StrokeStyle(lineWidth: 0.5))
                .foregroundStyle(Color.secondary)
        }
        .padding(.horizontal)  // Remove or adjust as needed
        .padding(.vertical, 5) // Adjust or remove as needed

//        .shadow(color: .gray, radius: 10)
        .padding(.bottom)
        .frame(height: 290, alignment: .top)
    }
}

#Preview {
    GameView(title: "Wordly", image: "wordly", description: "Guess Games with Clues")
}
