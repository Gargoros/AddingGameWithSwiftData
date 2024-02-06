//
//  HighScoreTitle.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 6.02.24.
//

import SwiftUI

struct HighScoreTitle: View {
    //MARK: - Variables
    
    //MARK: - Views
    var body: some View {
        
        HStack(){
            VTextImageView(
                imageName: Creatures.creature0.rawValue,
                text: "Rank",
                dim: 50)
            VTextImageView(
                imageName: Creatures.creature3.rawValue,
                text: "Score",
                dim: 50)
            VTextImageView(
                imageName: Creatures.creature4.rawValue,
                text: "Name",
                dim: 50)
        }
        .padding(.horizontal)
    }
}



#Preview {
    HighScoreTitle()
}
