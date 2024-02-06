//
//  HighScoreViewModel.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import Foundation
import CoreData
import Observation

@Observable class HighScoreViewModel{
    let container: NSPersistentContainer
    
    var highScores: Array<HighScoreEntity> = []
    
    let maxNumberOfHighScore: Int = 10
    
    var minHighScore: Int64? {
        if highScores.isEmpty{
            return nil
        } else{
            return highScores.last?.score
        }
    }
    
    init() {
        container = NSPersistentContainer(name: "HighScoreDataModel")
        
        //MARK: Load the data
        container
            .loadPersistentStores{ description, error in
                if let error {
                    print("Loading error: \(error.localizedDescription)")
                } else {
                    print("LOADING SUCCESSFUL")
                }
            }
        //MARK: Fetch data into highScores
        fetchHighScores()
    }
    
    //MARK: Checking if that is new high score or not
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
    
    //MARK: Fetch High Score
    func fetchHighScores() {
        let request = NSFetchRequest<HighScoreEntity>(entityName: "HighScoreEntity")
        let sortDescriptor = NSSortDescriptor(
            keyPath: \HighScoreEntity.score,
            ascending: false)
        request
            .sortDescriptors = [sortDescriptor]
        
        do{
            highScores = try container.viewContext.fetch(request)
        } catch let error{
            print("Error fetching high scores: \(error.localizedDescription)")
        }
    }
    
    //MARK: Save High Score
    func saveHighScore(){
        do {
            try container.viewContext.save()
            fetchHighScores()
        } catch let error{
            print("Error saving high score: \(error.localizedDescription)")
        }
    }
    
    //MARK: Add High Score
    func addHighScore(name: String, score: Int64){
        let entity = HighScoreEntity(context: container.viewContext)
        entity.name = name
        entity.score = score
        saveHighScore()
    }
    
    //MARK: Update player name
    func updateHighScoreName(entity: HighScoreEntity ,name: String){
        entity.name = name
        saveHighScore()
    }
    
    //MARK: Delete High Score
    func deleteHighScore(entity: HighScoreEntity){
        container.viewContext.delete(entity)
        saveHighScore()
    }
    func deleteScore(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = highScores[index]
        deleteHighScore(entity: entity)
    }
}
