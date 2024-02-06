//
//  HighScoreBackgroundView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct HighScoreBackgroundView: View {
    var body: some View {
        BackgroundView(
            colorList: [.black, .black, .gray],
            opacity: 0.7)
    }
}

#Preview {
    HighScoreBackgroundView()
}
