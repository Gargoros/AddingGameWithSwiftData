//
//  ScoreLivesLevelView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct ScoreLivesLevelView: View {
    //MARK: - Variables
    let score: Int
    let lives: Int
    let maxLives: Int
    let level: Int
    //MARK: - Views
    var body: some View {
        HStack(){
            TitleValueView(title: "Score", value: score)
            Spacer()
            TitleValueView(title: "Level", value: level)
            Spacer()
            LivesView(
                imageName: .creature0,
                numLives: lives,
                maxLives: maxLives)
            
        }
        
    }
}

#Preview {
    ZStack {
        GameBackgroundView()
        ScoreLivesLevelView(
            score: 22,
            lives: 2,
            maxLives: 3,
        level: 7)
    }
}
