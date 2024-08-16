//
//  SocialButton.swift
//  wb_chat_2
//
//  Created by Азамат Баев on 14.08.2024.
//
import SwiftUI

struct SocialButton: View {
    var socialMedia: SocialMediaPlatform
    var link: String

    var body: some View {
        Button(action: {
            // Действие при нажатии: открыть URL
        }) {
            Image(socialMedia.rawValue)
                .resizable()
                .frame(width: 20, height: 20)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 72, height: 40)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.accent, lineWidth: 1.67)
                .opacity(link.isEmpty ? 0.5 : 1)
        )
        .disabled(link.isEmpty)
    }
}
extension View {
    func initials(from name: String) -> String {
        let names = name.split(separator: " ")
        let initials = names.compactMap { $0.first }
        return initials.map(String.init).joined()
    }
}
