//
//  ContentView.swift
//  thiiink
//
//  Created by Manuel Julian Asbeck on 21.07.24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var showingSettings: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack (alignment: .top) {
                        TabView {
                            NavigationLink {
                                WordyView()
                                    .environmentObject(WordleDataModel(vocab: ["START", "NODES", "EVERY"]))
                                    .toolbar(.hidden, for: .tabBar)
                            } label: {
                                GameView(title: "Wordy", image: "wordly", description: "Guess Words from Clues.")
                            }
                            NavigationLink {
//                                    .environmentObject(WordleDataModel(vocab: vocab))
//                                    .toolbar(.hidden, for: .tabBar)
                            } label: {
                                GameView(title: "WordMatch", image: "wordly", description: "Match Words with their Meaning.")
                            }
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .never))
                        .frame(minHeight: 310, alignment: .top)
                    }
                }
            }
            .sheet(isPresented: $showingSettings) {
                Settings()
            }
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading) {
                    Text("cluu")
                        .font(.title)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSettings.toggle()
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
    }

}

#Preview {
    HomeView()
}
