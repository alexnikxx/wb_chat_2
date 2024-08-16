//
//  SocialButton.swift
//  wb_chat_2
//
//  Created by Азамат Баев on 14.08.2024.
//
import SwiftUI

struct SocialButton: View {
    var imageName: String
    var url: String
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        Button(action: openSocials) {
            Image(imageName)
                .resizable()
                .frame(width: 20, height: 20)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 72, height: 40)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.purple, lineWidth: 1.67)
        )
        .disabled(url.isEmpty)
        .opacity(url.isEmpty ? 0.5 : 1.0) 
    }
    
    private func openSocials() {
        guard let url = URL(string: url) else { return }
        openURL(url)
    }
}


