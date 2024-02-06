//
//  HighScoreEntity.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 6.02.24.
//

import Foundation
import SwiftData

@Model
class HighScoreEntity: Identifiable{
    let id: UUID = UUID()
    var name: String
    let score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
