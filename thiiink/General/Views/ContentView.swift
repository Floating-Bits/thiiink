//
//  ContentView.swift
//  thiiink
//
//  Created by Manuel Julian Asbeck on 21.07.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Statistics")
                .tabItem {
                    Label("Statistics", systemImage: "number")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
