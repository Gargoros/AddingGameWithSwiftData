//
//  AdditionGameViewModel.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import Foundation
import Observation

@Observable class AdditionGameViewModel {
    var gameModel: GameModel = GameModel.defaultGame
    
    private var problemCount: Int = 0
    
    let nextLevelBound: Int = 5
    let maxIncreaseScore: Int = 10
    
    var score: Int {
        return gameModel.score
    }
    var timeToMoveUpToNextLevel: Bool {
        return problemCount % nextLevelBound == 0
    }
    var number1: Int {
        return gameModel.currentProblem.number1
    }
    var number2: Int {
        return gameModel.currentProblem.number2
    }
    var possibleSolutions: Array<Int> {
        return gameModel.currentProblem.solutions.shuffled()
    }
    var answer: Int {
        return gameModel.currentProblem.answer
    }
    var gameOver: Bool {
        return gameModel.gameOver
    }
    
    func generateNumbers(){
        //MARK: Generate a new problem
        gameModel.currentProblem = ProblemModel(level: gameModel.level)
        
        //MARK: Increase problemCount
        problemCount += 1
        
        if timeToMoveUpToNextLevel{
            gameModel.level += 1
        }
    }
    func increaseScore(){
        gameModel.score += min(gameModel.level, maxIncreaseScore)
    }
    func loseLife(){
        gameModel.lives = max(gameModel.lives - 1, 0)
        gameModel.score = max(gameModel.score - 2, 0)
    }
    func resetGame(){
        gameModel = GameModel.defaultGame
        problemCount = 0
    }
}
