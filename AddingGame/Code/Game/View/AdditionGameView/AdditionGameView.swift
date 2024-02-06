//
//  AdditionGameView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI
import SwiftData

struct AdditionGameView: View {
    //MARK: - Variables
    private var gameViewModel: AdditionGameViewModel = AdditionGameViewModel()
    @Query (sort: [SortDescriptor(\HighScoreEntity.score, order: .reverse)])
    private var highScores: Array<HighScoreEntity>
    @State private var highScoreViewIsPresented: Bool = false
    @State private var playerName: String = ""
    
    let maxNumberOfHighScore: Int = 10
    
    var minHighScore: Int? {
        if highScores.isEmpty{
            return nil
        } 
        else{
            return highScores.last?.score
        }
    }
    
    
    var showHighScore: Bool{
        gameViewModel.gameOver && isNewHighScore(score: gameViewModel.score)
    }
    var showGameOverView: Bool {
        gameViewModel.gameOver
    }
    
    //MARK: - Views
    var body: some View {
        ZStack(){
            
            GameBackgroundView()
            
            VStack(){
                ScoreLivesLevelView(
                    score: gameViewModel.score,
                    lives: gameViewModel.gameModel.lives,
                    maxLives: 3,
                    level: gameViewModel.gameModel.level)
                
                Spacer()
                BubbleView(
                    textColor: .white,
                    bgColor: .purple.opacity(0.7),
                    name: "bubble3",
                    text: "\(gameViewModel.number1) + \(gameViewModel.number2)")
                Spacer()
                OptionsView(gameViewModel: gameViewModel)
            }
            .padding()
            .blur(radius: showGameOverView ? 5 : 0)
            .disabled(showGameOverView)
            
            GameOverView(
                score: gameViewModel.score)
                .padding()
                .blur(radius: showGameOverView ? 0 : 30)
                .opacity(showGameOverView ? 1 : 0)
                .disabled(!showGameOverView)
                .onTapGesture {
                    gameViewModel.resetGame()
                }
                
        }
        .fullScreenCover(
            isPresented: $highScoreViewIsPresented,
            onDismiss: {
                gameViewModel.resetGame()
            }){
                EnterNewHighScoreView(
                    score: gameViewModel.score,
                    playerName: $playerName,
                    isPresented: $highScoreViewIsPresented)
            }
            .onChange(of: showHighScore ) {
                highScoreViewIsPresented = showHighScore
            }
    }
    
    func isNewHighScore(score: Int) -> Bool{
        if score <= 0 {
            return false
        }else if let minHighScore{
            return minHighScore < score || highScores.count <= maxNumberOfHighScore
        }
        else {
            return true
        }
    }
}

#Preview {
    AdditionGameView()
        .modelContainer(for: HighScoreEntity.self)
}
