//
//  ProblemModel.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import Foundation

struct ProblemModel: Identifiable {
    let id: UUID = UUID()
    
    let number1: Int
    let number2: Int
    let level: Int
    
    //MARK: solutions[0] is the answer
    //the other elements are distractions
    let solutions: Array<Int>
    
    var answer: Int{
        return solutions[0]
    }
    
    func checkSolution(value: Int) -> Bool {
        return !solutions.isEmpty && value == answer
    }
    
    //MARK: Initialisation
    init(level: Int){
        self.level = level
        
        let lower: Int = level * 5
        let upper: Int = (level + 1) * 5
        
        self.number1 = Int.random(in: lower...upper)
        self.number2 = Int.random(in: lower...upper)
        
        let answer = number1 + number2
        var newSolution: Array<Int> = []
        newSolution.append(answer) // True solution at solution[0] = 27
        newSolution.append(answer + 10) // Distraction => 37
        
        let belowAnswer = answer - 5
        let aboveAnswer = answer + 5
        newSolution.append(Int.random(in: answer+1...aboveAnswer))
        newSolution.append(Int.random(in: belowAnswer..<answer))
        
        self.solutions = newSolution
    }
    
    
}
