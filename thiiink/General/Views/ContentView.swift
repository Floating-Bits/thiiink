//
//  ContentView.swift
//  thiiink
//
//  Created by Manuel Julian Asbeck on 21.07.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var stats: [Statistic]
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            VStack {
                ForEach(stats) { stat in
                    Text("\(stat.score)")
                }
            }
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
