//
//  BubbleView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct BubbleView: View {
    //MARK: - Variables
    let bubbleSize: CGFloat = 200.0
    let textColor: Color
    let bgColor: Color
    let name: String
    let text: String
    
    @State private var rotate = 0.0
    //MARK: - Views
    var body: some View {
        Text(text)
            .foregroundStyle(textColor)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding()
            .background{
                Image(name)
                    .resizable()
                    .scaledToFill()
                    .opacity(0.6)
                    .rotationEffect(Angle(degrees: rotate))
                    .background(bgColor)
                    .clipShape(Circle())
            }
            .padding()
            .onAppear{
                withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)){
                    rotate = 360.0
                }
            }
    }
}

#Preview {
    VStack(){
        BubbleView(
            textColor: .black,
            bgColor: .purple.opacity(0.4),
            name: "bubble1",
            text: "25"
        )
        BubbleView(
            textColor: .black,
            bgColor: .purple.opacity(0.4),
            name: "bubble2",
            text: "25"
        )
        BubbleView(
            textColor: .white,
            bgColor: .purple.opacity(0.4),
            name: "bubble1",
            text: "25"
        )
    }
}
