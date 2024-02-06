//
//  GameOverView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 6.02.24.
//

import SwiftUI

struct GameOverView: View {
    //MARK: - Variables
    let score: Int
    //MARK: - Views
    var body: some View {
        VStack(){
            Label(
                title: {
                    Text("Game Over")
                        .multilineTextAlignment(.center)
                    Image(systemName: "restart.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.yellow)
                },
                icon: {
                    Image(Creatures.creature1.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .shadow(radius: 3)
                }
            )
            
            Text("Your score: " + "\(score)")
                
        }
        .font(.largeTitle)
        .fontWeight(.semibold)
        .foregroundStyle(.white)
        .padding()
        .background(Color.gray.gradient.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .shadow(radius: 3)
    }
}

#Preview {
    GameOverView(
        score: 302)
}
