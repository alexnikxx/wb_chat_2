//
//  Extension + View.swift
//  wb_chat_2
//

import SwiftUI

extension View {
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

    func initials(from name: String) -> String {
        let names = name.split(separator: " ")
        let initials = names.compactMap { $0.first }
        return initials.map(String.init).joined()
    }
}
