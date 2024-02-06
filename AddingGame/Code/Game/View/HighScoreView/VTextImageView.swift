//
//  VTextImageView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 6.02.24.
//

import SwiftUI

struct VTextImageView: View {
    //MARK: - Variables
    let imageName: String
    let text: LocalizedStringKey
    let dim: Double
    
    //MARK: - Views
    var body: some View {
        VStack(spacing: 0){
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: dim, height: dim)
                .shadow(radius: 5)

            Text(text)
                .fixedSize(horizontal: true, vertical: false)
                .font(.headline)
        }
        .foregroundStyle(.white)
        .fontWeight(.semibold)
        .frame(maxWidth: .infinity)
    }
}
#Preview {
    VTextImageView(
        imageName: Creatures.creature0.rawValue,
        text: "Rank",
        dim: 100)
}
