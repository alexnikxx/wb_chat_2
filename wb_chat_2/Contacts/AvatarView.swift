//
//  AvatarView.swift
//  wb_chat_2
//
//  Created by Aleksandra Nikiforova on 21/08/24.
//

import SwiftUI
import UISystem

struct AvatarView: View {
    let contact: Contact

    var body: some View {
        ZStack {
            if contact.haveStories {
                if contact.avatar != nil {
                    strokeForStories(gradient: Color.gradient.style1, startPoint: .leading, endPoint: .trailing)
                } else {
                    strokeForStories(gradient: Color.gradient.style2, startPoint: .topLeading, endPoint: .bottomTrailing)
                }
            }

            if let uiImage = contact.avatarImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .cornerRadius(16)
            } else {
                Text(initials(from: contact.fullname))
                    .foregroundStyle(.white)
                    .frame(width: 48, height: 48)
                    .background(Color.CustomColors.mainWbColor)
                    .cornerRadius(16)
            }

            contact.onlineStatusMessage == "Online" ? setStatus().position(x: 48, y: 6) : nil
        }
        .frame(width: 56, height: 56)
    }

    private func setStatus() -> some View {
        Circle()
            .stroke(Color.white, lineWidth: 4)
            .fill(Color.accent.success)
            .frame(width: 12, height: 12)
    }
}
