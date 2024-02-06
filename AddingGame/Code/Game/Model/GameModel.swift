//
//  GameModel.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import Foundation

struct GameModel: Identifiable{
    let id: UUID = UUID()
    
    var level: Int
    var score: Int
    var speed: Int
    var lives: Int
    var currentProblem: ProblemModel
    
    var gameOver: Bool{
        return lives == 0
    }
    
    init(level: Int, score: Int, speed: Int, lives: Int){
        self.level = level
        self.score = score
        self.speed = speed
        self.lives = lives
        
        self.currentProblem = ProblemModel(level: level)
    }
    
    //MARK: Update score and lives
    mutating func updateScore(valeu: Int) {
        let isCorrect = currentProblem.checkSolution(value: valeu)
        if isCorrect {
            score += level
        }else{
            lives -= 1
        }
    }
    
    //MARK: Default Game
    static let defaultGame = GameModel.init(
        level: 1,
        score: 0,
        speed: 1,
        lives: 3
    )
}
