//
//  Extension + View.swift
//  wb_chat_2
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
    
    func strokeForStories(gradient: Gradient, startPoint: UnitPoint, endPoint: UnitPoint) -> some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 56, height: 56)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .inset(by: 1)
                    .stroke(
                        LinearGradient(
                            gradient: gradient,
                            startPoint: startPoint,
                            endPoint: endPoint
                        ),
                        lineWidth: 2
                    )
            )
    }
}
