//
//  ButtonModifier.swift
//  WB
//
//  Created by Aleksandra Nikiforova on 25/07/24.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.appFont(size: 16).weight(.semibold))
            .foregroundStyle(.buttonText)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 48)
            .background(Color.button)
            .cornerRadius(30)
    }
}
