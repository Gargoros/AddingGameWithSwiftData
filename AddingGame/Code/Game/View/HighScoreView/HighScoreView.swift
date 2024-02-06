//
//  HighScoreView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct HighScoreView: View {
    //MARK: - Variables
    @Environment(HighScoreViewModel.self) private var highScoreViewModel
    
    let dim: Double = 100.0
    var highScoreList: Array<(offset: Int, element: HighScoreEntity)>{
        return Array(highScoreViewModel.highScores.enumerated())
    }
    
    //MARK: - Views
    var body: some View {
        ZStack(){
            HighScoreBackgroundView()
            VStack(){
                HighScoreTitle()
                
                List{
                    ForEach(Array(highScoreViewModel.highScores.enumerated()), id: \.offset){index, entity in
                        
                        RankScoreView(
                            rank: index + 1,
                            score: Int(entity.score),
                            entity: entity)
                    }
                    .onDelete(perform: highScoreViewModel.deleteScore)
                    .listRowBackground(Color.black.opacity(0.4))
                    .padding()
                }
                .listStyle(.plain)
                
                Image(Creatures.creature2.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: dim, height: dim)
            }
        }
    }
}

#Preview {
    HighScoreView()
        .environment(HighScoreViewModel())
}
