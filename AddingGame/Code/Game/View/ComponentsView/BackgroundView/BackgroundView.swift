//
//  BackgroundView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct BackgroundView: View {
    //MARK: - Variables
    let colorList: Array<Color>
    let opacity: Double
    //MARK: - Views
    var body: some View {
        LinearGradient(
            colors: colorList,
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .opacity(opacity)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView(
        colorList: [.purple, .pink, .clear],
        opacity: 0.7)
}
