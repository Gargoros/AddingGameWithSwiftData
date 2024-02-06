//
//  GameBackgroundView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct GameBackgroundView: View {
    var body: some View {
        BackgroundView(
            colorList: [.purple, .pink, .clear],
            opacity: 0.7)
    }
}

#Preview {
    GameBackgroundView()
}
