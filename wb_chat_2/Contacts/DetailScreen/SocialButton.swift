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
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(.horizontal, 26)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.CustomColors.mainWbColor, lineWidth: 1.67)
                )
        }
        .disabled(url.isEmpty)
        .opacity(url.isEmpty ? 0.5 : 1.0) 
    }
    
    private func openSocials() {
        guard let url = URL(string: url) else { return }
        openURL(url)
    }
}


