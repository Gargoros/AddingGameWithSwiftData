//
//  RankScoreView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 6.02.24.
//

import SwiftUI

struct RankScoreView: View {
    //MARK: - Variables
    let rank: Int
    let score: Int
    let entity: HighScoreEntity
    let scoreColors: Array<Color> = [
        .blue, .pink, .purple, .yellow, .orange
    ]
    var color: Color {
        return scoreColors[(rank - 1) % scoreColors.count]
    }
    
    @State private var editMode: Bool = false
    @Environment(HighScoreViewModel.self) private var highScoreViewModel
    
    @State private var playerName: String = ""
    @State private var save: Bool = false
    
    //MARK: - Views
    var body: some View {
        VStack(){
            if editMode {
                HStack(){
                    TextField(entity.name ?? "Name", text: $playerName)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .padding()
                        .background(.green.gradient.opacity(0.9))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Button(
                        action: {
                            highScoreViewModel.updateHighScoreName(entity: entity, name: playerName.isEmpty ? (entity.name ?? "Anon") : playerName)
                            withAnimation(){
                                editMode.toggle()
                            }
                        },
                        label: {
                        Text("Save")
                                .foregroundStyle(.white)
                                .padding()
                                .background(.red.gradient)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                        
                }
            }else{
                HStack(){
                    Text(rank.ordinal)
                        .frame(maxWidth: .infinity)
                    Text("\(score)")
                        .frame(maxWidth: .infinity)
                    Text(entity.name?.uppercased() ?? "")
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(color)
                .onTapGesture {
                    withAnimation(){
                        editMode.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    RankScoreView(
        rank: 2,
        score: 123,
        entity: HighScoreViewModel().highScores[0])
    .environment(HighScoreViewModel())
}
