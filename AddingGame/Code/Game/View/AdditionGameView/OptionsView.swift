//
//  OptionsView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct OptionsView: View {
    //MARK: - Variables
    let gameViewModel: AdditionGameViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    //MARK: - Views
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(gameViewModel.possibleSolutions, id: \.self){option in
                
                //MARK: -> Cheat Color
                //let cheatColor: Color = option == gameViewModel.answer ? .red : .black
                
                SelectButtonView(option: option, gameViewModel: gameViewModel)
            }
        }
    }
}

struct SelectButtonView: View {
    //MARK: - Variables
    let option: Int
    let colorList: Array<Color> = [
        .green.opacity(0.9),
        .red.opacity(0.9),
        .yellow.opacity(0.9),
        .blue.opacity(0.9),
        .orange.opacity(0.9),
        .pink.opacity(0.9),
        .white.opacity(0.9),
        .brown.opacity(0.9)]
    
    @State var selectedOption: Int? = nil
    let gameViewModel: AdditionGameViewModel
    
    var isSelected: Bool {
        return selectedOption == option
    }
    var scale: CGFloat {
        return isSelected ? 1.2: 1.0
    }
    var color: Color{
        return isSelected ? getRandomColor() : .purple.opacity(0.7)
    }
    
    func getRandomColor() -> Color {
        return colorList.randomElement() ?? .green.opacity(0.7)
    }
    
    //MARK: - Views
    var body: some View {
        BubbleView(
            textColor: .black, // cheatColor
            bgColor: color,
            name: "bubble2",
            text: "\(option)")
        .scaleEffect(scale)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3).repeatCount(1, autoreverses: true)){
                selectedOption = option
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                withAnimation(){
                    selectedOption = nil
                }
            }
            withAnimation(){
                if gameViewModel.answer == option{
                    gameViewModel.increaseScore()
                }else{
                    gameViewModel.loseLife()
                }
                gameViewModel.generateNumbers()
            }
        }
    }
}

#Preview {
    OptionsView(gameViewModel: AdditionGameViewModel())
}
