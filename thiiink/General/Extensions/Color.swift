//
//  Color.swift
//  cluu
//
//  Created by Manuel Julian Asbeck on 29.06.24.
//

import Foundation
import SwiftUI

extension Color {
    static var unused: Color {
        Color.gray
    }
    
    static var misplaced: Color {
        Color.yellow
    }
    
    static var correct: Color {
        Color.green
    }
    
    static var wrong: Color {
        Color.black.opacity(0.7)
    }
}
