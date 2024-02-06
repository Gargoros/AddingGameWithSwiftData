//
//  NumericExtention.swift
//  AddingGame
//
//  Created by MIKHAIL ZHACHKO on 6.02.24.
//

import Foundation

let ordinalFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .ordinal
    return numberFormatter
}()

extension Numeric {
    var ordinal: String {
        return ordinalFormatter
            .string(for: self) ?? String(describing: self)
    }
}
