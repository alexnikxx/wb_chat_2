//
//  SymbolView.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 06/08/24.
//

import SwiftUI
import UISystem

enum SymbolType {
    case digit
    case dot
}

struct SymbolView: View {
    let symbol: Character
    let symbolType: SymbolType

    var body: some View {
        switch symbolType {
        case .digit:
            Text("\(symbol)")
                .frame(width: 24, height: 24)
                .font(.heading1)
        case .dot:
            Circle()
                .frame(width: 24, height: 24)
                .foregroundStyle(Color.CustomColors.textfield)
        }
    }
}
