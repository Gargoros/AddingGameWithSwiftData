//
//  HighScoreView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI
import SwiftData

struct HighScoreView: View {
    //MARK: - Variables
    
    @Query (sort: [SortDescriptor(\HighScoreEntity.score, order: .reverse)])
    private var highScores: Array<HighScoreEntity>
    @Environment(\.modelContext) var modelContext
    
    let dim: Double = 100.0
    
    
    var highScoreList: Array<(offset: Int, element: HighScoreEntity)>{
        return Array(highScores.enumerated())
    }
    
    
    //MARK: - Views
    var body: some View {
        ZStack(){
            HighScoreBackgroundView()
            VStack(){
                HighScoreTitle()
                
                List{
                    ForEach(highScoreList, id: \.offset){index, entity in
                        
                        RankScoreView(
                            rank: index + 1,
                            score: Int(entity.score),
                            entity: entity)
                    }
                    .onDelete(perform: deleteScore)
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
    
    func deleteScore(indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(highScores[index])
        }
    }
}

#Preview {
    HighScoreView()
        .modelContainer(for: HighScoreEntity.self)
}
