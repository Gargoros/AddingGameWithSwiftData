//
//  ContentView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct MainView: View {
    
    
    var body: some View {
        TabView{
            AdditionGameView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            HighScoreView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Score")
                }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: HighScoreEntity.self)
}
