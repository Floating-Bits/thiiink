//
//  ToastView.swift
//  cluu
//
//  Created by Manuel Julian Asbeck on 30.06.24.
//

import SwiftUI

struct ToastView: View {
    
    let toastText: String
    
    var body: some View {
        Text(toastText)
            .foregroundStyle(Color(uiColor: .systemBackground))
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primary))
    }
}

#Preview {
    ToastView(toastText: "Not in word list.")
}
