//
//  AddingGameApp.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

@main
struct AddingGameApp: App {
    
    @State var highScoreViewModel = HighScoreViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(highScoreViewModel)
        }
    }
}
