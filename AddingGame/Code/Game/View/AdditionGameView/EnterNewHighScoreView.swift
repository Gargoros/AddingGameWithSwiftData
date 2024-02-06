//
//  EnterNewHighScoreView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 6.02.24.
//

import SwiftUI
import SwiftData

struct EnterNewHighScoreView: View {
    //MARK: - Variables
    let score: Int
    @Binding var playerName: String
    @Binding var isPresented: Bool
    @Environment(\.modelContext) var modelContext
    
    //MARK: - Views
    var body: some View {
        ZStack(){
            BackgroundView(
                colorList: [.blue, .purple],
                opacity: 1)
            VStack(){
                Text("New High Score")
                    
                Text("\(score)")
                    .padding()
                    
                TextField("Enter Your Name", text: $playerName)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background(.white.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.black)
                    
                
                Button(
                    action: {
                        addHighScore()
                        isPresented = false
                    },
                    label: {
                        Text("Save")
                            .font(.title)
                            .padding()
                            .background(Color.green.gradient)
                            .shadow(radius: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                .padding()
            }
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
           
        }
    }
    
    func addHighScore(){
        playerName = playerName.isEmpty ? "Anon" : playerName
        modelContext.insert(HighScoreEntity(name: playerName, score: score))
    }
}

#Preview {
    EnterNewHighScoreView(
        score: 123,
        playerName: .constant("Sam"),
        isPresented: .constant(true)
    )
    .modelContainer(for: HighScoreEntity.self)
}
