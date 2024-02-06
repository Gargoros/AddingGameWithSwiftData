//
//  AddingGameApp.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI
import SwiftData

@main
struct AddingGameApp: App {
        
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: HighScoreEntity.self)
        }
    }
}
