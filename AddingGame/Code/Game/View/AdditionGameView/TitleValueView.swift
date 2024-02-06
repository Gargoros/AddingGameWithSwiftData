//
//  TitleValueView.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 5.02.24.
//

import SwiftUI

struct TitleValueView: View {
    //MARK: - Variables
    let title: String
    let value: Int
    //MARK: - Views
    var body: some View {
        VStack {
            Text(title)
            Text("\(value)")
        }
        .font(.headline)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)
    }
}

#Preview {
    TitleValueView(
        title: "Level",
        value: 7)
}
