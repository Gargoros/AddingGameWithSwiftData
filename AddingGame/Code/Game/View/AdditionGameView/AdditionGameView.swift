//
//  AdditionGameView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct AdditionGameView: View {
    //MARK: - Variables
    private var gameViewModel: AdditionGameViewModel = AdditionGameViewModel()
    @Environment(HighScoreViewModel.self) private var highScoreViewModel
    @State private var highScoreViewIsPresented: Bool = false
    @State private var playerName: String = ""
    
    
    var showHighScore: Bool{
        gameViewModel.gameOver && highScoreViewModel
            .isNewHighScore(score: gameViewModel.score)
    }
    //TODO: Update this once we add the high score view model
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
}

#Preview {
    AdditionGameView()
        .environment(HighScoreViewModel())
}
