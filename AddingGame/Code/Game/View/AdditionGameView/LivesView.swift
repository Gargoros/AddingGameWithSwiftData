//
//  LivesView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct LivesView: View {
    //MARK: - Variables
    let imageName: Creatures
    let numLives: Int
    let maxLives: Int
    let dim: Double = 30.0
    //MARK: - Views
    var body: some View {
        HStack(){
            ForEach(0..<maxLives, id: \.self) { item in
                
                let opacity: CGFloat = item >= numLives ? 0 : 1
                
                Image(imageName.rawValue)
                    .resizable()
                    .scaledToFit()
                    .opacity(opacity)
                .frame(width: dim, height: dim)
                
            }
        }
    }
}

#Preview {
    LivesView(
        imageName: .creature0,
        numLives: 2,
        maxLives: 3)
}
